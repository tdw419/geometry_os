; DESCRIPTION: This GeOS assembly code implements a network packet viewer that reads from the `/dev/net` device, displays a scrolling log of packets with hex data and rate statistics, and simulates traffic by writing random data to the net port. The interface includes a title bar, a scrolling packet log area, and a status bar showing packet count and rate.

; netmon.asm -- Phase 141: Network Packet Viewer
;
; Visual network packet monitor. Reads from /dev/net device,
; displays scrolling packet log with hex data and rate stats.
; Simulates traffic by writing random data to the net port.
;
; Layout:
;   Row 0-1: Title bar
;   Row 2-29: Scrolling packet log (colored bars per packet)
;   Row 30-31: Status bar with packet count and rate
;
; Opcodes: LDI, MOV, ADD, SUB, MUL, DIV, AND, OR, SHL, SHR, SAR
;          MOD, CMP, JZ, JNZ, BLT, BGE, JMP, FILL, RECTF, PSET
;          DRAWTEXT, TEXT, IKEY, RAND, FRAME, OPEN, READ, IOCTL
;          STORE, LOAD

; == INIT ==
    LDI r14, 1
    LDI r1, 0
    LDI r15, 0             ; total packets
    LDI r8, 0            ; rate counter
    LDI r4, 0            ; displayed rate
    LDI r9, 0            ; buffer head (0-31)
    LDI r22, 0x5000       ; packet buffer (32 entries, 4 words each)
    LDI r23, 32           ; max packets

    ; Open /dev/net
    LDI r7, net_path
    LDI r13, 0
    OPEN r7, r13
    MOV r6, r12            ; r6 = net fd

; == MAIN LOOP ==
main_loop:
    ; Dark background
    LDI r7, 0x080810
    FILL r7

    ; == SIMULATE PACKETS (every ~32 frames) ==
    LDI r7, 0xFFE
    LOAD r7, r7
    LDI r13, 31
    AND r7, r13
    LDI r13, 15
    CMP r7, r13
    JNZ r12, no_sim
    RAND r7
    LDI r13, 0xFFC
    STORE r13, r7
no_sim:

    ; == READ FROM /dev/net ==
    LDI r7, 0xFFC
    LDI r13, 1
    READ r6, r7, r13
    LDI r7, 0
    CMP r12, r7
    JZ r12, no_pkt

    ; Store packet
    LDI r7, 0xFFC
    LOAD r24, r7           ; data word

    ; Buffer[head*4 + 0] = data
    MOV r7, r9
    LDI r13, 2
    SHL r7, r13
    MOV r13, r22
    ADD r13, r7
    STORE r13, r24

    ; Buffer[head*4 + 1] = top byte (for color)
    MOV r7, r14
    ADD r13, r7
    MOV r2, r24
    LDI r3, 24
    SHR r2, r3             ; top byte
    STORE r13, r2

    ; Buffer[head*4 + 2] = TICKS at receipt
    MOV r7, r14
    ADD r13, r7
    LDI r2, 0xFFE
    LOAD r2, r2
    STORE r13, r2

    ; Advance head
    ADD r9, r14
    LDI r7, 32
    CMP r9, r7
    BLT r12, no_wrap
    LDI r9, 0
no_wrap:
    ADD r15, r14
    ADD r8, r14

no_pkt:
    ; == RATE UPDATE ==
    LDI r7, 0xFFE
    LOAD r5, r7
    LDI r7, 63
    AND r5, r7
    LDI r7, 2
    CMP r5, r7
    BGE r12, no_rate
    MOV r4, r8
    LDI r8, 0
no_rate:

    ; == TITLE BAR ==
    LDI r7, 0
    LDI r13, 0
    LDI r2, 256
    LDI r3, 14
    LDI r10, 0x003366
    RECTF r7, r13, r2, r3, r10

    LDI r16, 4
    LDI r17, 3
    LDI r18, title_str
    LDI r19, 0xFFFFFF
    LDI r20, 0x003366
    DRAWTEXT r16, r17, r18, r19, r20

    ; Net status indicator
    LDI r7, 0xE003
    LDI r13, 0
    LDI r2, 0
    IOCTL r7, r13, r2
    LDI r7, 0
    CMP r12, r7
    JZ r12, net_down_label

    ; Net status indicator
    LDI r16, 90
    LDI r17, 3
    LDI r18, up_str
    LDI r19, 0x00FF00
    LDI r20, 0x003366
    DRAWTEXT r16, r17, r18, r19, r20
    JMP pkt_draw

net_down_label:
    LDI r16, 90
    LDI r17, 3
    LDI r18, down_str
    LDI r19, 0xFF0000
    LDI r20, 0x003366
    DRAWTEXT r16, r17, r18, r19, r20

pkt_draw:
    ; == DRAW PACKET LOG ==
    ; Show last 28 packets as colored bars
    LDI r25, 0             ; display row (0-27)
    LDI r17, 16            ; start y

pkt_row:
    LDI r7, 0
    CMP r15, r7
    JZ r12, show_empty

    ; Determine entry index
    LDI r7, 28
    CMP r15, r7
    BGE r12, full_buf
    ; Partial: show rows 0..total-1
    CMP r25, r15
    BLT r12, do_draw_entry
    JMP skip_row

full_buf:
    ; entry = (head - 28 + row) & 31
    MOV r7, r9
    LDI r13, 28
    SUB r7, r13
    ADD r7, r25
    LDI r13, 31
    AND r7, r13

do_draw_entry:
    ; r7 = entry index
    LDI r13, 2
    SHL r7, r13             ; entry * 4
    MOV r2, r22
    ADD r2, r7             ; buffer base + offset

    ; Load color byte (word 1)
    MOV r13, r2
    ADD r13, r14
    LOAD r10, r13           ; color index (top byte of data)

    ; Generate color from the byte: hue mapping
    ; Use top 3 bits for hue channel selection
    LDI r3, 0xE0
    AND r10, r3            ; top 3 bits
    LDI r3, 5
    SHR r10, r3            ; shift to bits 8-10 range
    ; Create a visible color
    LDI r3, 0x44
    OR r10, r3             ; ensure minimum brightness

    ; Draw row bar
    LDI r7, 2
    LDI r13, 256
    LDI r3, 7
    RECTF r7, r17, r13, r3, r10

    ; Draw a bright accent line on left
    MOV r7, r2
    LOAD r0, r7           ; data word
    LDI r5, 16
    SHR r0, r5
    LDI r5, 0xF
    AND r0, r5
    LDI r5, 2
    MUL r0, r5
    ADD r0, r14             ; width = 3..33
    LDI r5, 0x00CCFF      ; cyan accent
    RECTF r7, r17, r0, r3, r5

skip_row:
    LDI r7, 8
    ADD r17, r7
    ADD r25, r14
    LDI r7, 28
    CMP r25, r7
    BLT r12, pkt_row
    JMP draw_stat

show_empty:
    LDI r16, 80
    LDI r17, 130
    LDI r18, empty_str
    LDI r19, 0x555555
    LDI r20, 0
    DRAWTEXT r16, r17, r18, r19, r20

draw_stat:
    ; == STATUS BAR ==
    LDI r7, 0
    LDI r13, 242
    LDI r2, 256
    LDI r3, 14
    LDI r10, 0x002244
    RECTF r7, r13, r2, r3, r10

    ; Build "PKT:N" at 0x6000
    LDI r7, 0x6000
    LDI r10, 80            ; 'P'
    STORE r7, r10
    ADD r7, r14
    LDI r10, 75
    STORE r7, r10
    ADD r7, r14
    LDI r10, 84
    STORE r7, r10
    ADD r7, r14
    LDI r10, 58
    STORE r7, r10
    ADD r7, r14
    LDI r10, 32
    STORE r7, r10
    ADD r7, r14

    ; Decimal convert r15
    MOV r13, r15
    LDI r2, 0x6020
    LDI r10, 0
    STORE r2, r10
    ; Special case: if r15 == 0, write '0'
    LDI r10, 0
    CMP r13, r10
    JNZ r12, dec_nonzero
    LDI r10, 48
    SUB r2, r14
    STORE r2, r10
    JMP dec_copy
dec_nonzero:
    LDI r27, 10
    MOV r28, r13
    DIV r28, r27
    MUL r28, r27
    MOV r29, r13
    SUB r29, r28
    LDI r28, 48
    ADD r29, r28
    SUB r2, r14
    STORE r2, r29
    LDI r28, 10
    DIV r13, r28
    LDI r28, 0
    CMP r13, r28
    JNZ r12, dec_nonzero
dec_copy:
    LDI r7, 0x6005
dec_cp:
    LOAD r13, r2
    LDI r27, 0
    CMP r13, r27
    JZ r12, dec_cp_done
    STORE r7, r13
    ADD r7, r14
    ADD r2, r14
    JMP dec_cp
dec_cp_done:
    LDI r10, 0
    STORE r7, r10

    LDI r16, 4
    LDI r17, 244
    LDI r18, 0x6000
    LDI r19, 0xFFFFFF
    LDI r20, 0x002244
    DRAWTEXT r16, r17, r18, r19, r20

    ; Build "RATE:N/s" at 0x6030
    LDI r7, 0x6030
    LDI r10, 82
    STORE r7, r10
    ADD r7, r14
    LDI r10, 65
    STORE r7, r10
    ADD r7, r14
    LDI r10, 84
    STORE r7, r10
    ADD r7, r14
    LDI r10, 69
    STORE r7, r10
    ADD r7, r14
    LDI r10, 58
    STORE r7, r10
    ADD r7, r14
    LDI r10, 32
    STORE r7, r10
    ADD r7, r14

    ; Decimal convert r4
    MOV r13, r4
    LDI r2, 0x6050
    LDI r10, 0
    STORE r2, r10
    LDI r10, 0
    CMP r13, r10
    JNZ r12, rdec_nonzero
    LDI r10, 48
    SUB r2, r14
    STORE r2, r10
    JMP rdec_copy
rdec_nonzero:
    LDI r27, 10
    MOV r28, r13
    DIV r28, r27
    MUL r28, r27
    MOV r29, r13
    SUB r29, r28
    LDI r28, 48
    ADD r29, r28
    SUB r2, r14
    STORE r2, r29
    LDI r28, 10
    DIV r13, r28
    LDI r28, 0
    CMP r13, r28
    JNZ r12, rdec_nonzero
rdec_copy:
    LDI r7, 0x6037
rdec_cp:
    LOAD r13, r2
    LDI r27, 0
    CMP r13, r27
    JZ r12, rdec_done
    STORE r7, r13
    ADD r7, r14
    ADD r2, r14
    JMP rdec_cp
rdec_done:
    LDI r10, 47
    STORE r7, r10
    ADD r7, r14
    LDI r10, 115
    STORE r7, r10
    ADD r7, r14
    LDI r10, 0
    STORE r7, r10

    LDI r16, 130
    LDI r17, 244
    LDI r18, 0x6030
    LDI r19, 0xFFFF00
    LDI r20, 0x002244
    DRAWTEXT r16, r17, r18, r19, r20

    FRAME
    JMP main_loop

; == DATA ==
.org 0x4000
net_path:
    .asciz "/dev/net"
    .db 0

title_str:
    .asciz "NETMON - Packet Viewer"
    .db 0

up_str:
    .asciz "UP"
    .db 0

down_str:
    .asciz "DOWN"
    .db 0

empty_str:
    .asciz "NO PACKETS YET"
    .db 0
