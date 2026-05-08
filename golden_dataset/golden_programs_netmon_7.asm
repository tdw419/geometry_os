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
    LDI r15, 1
    LDI r14, 0
    LDI r5, 0             ; total packets
    LDI r3, 0            ; rate counter
    LDI r13, 0            ; displayed rate
    LDI r1, 0            ; buffer head (0-31)
    LDI r22, 0x5000       ; packet buffer (32 entries, 4 words each)
    LDI r23, 32           ; max packets

    ; Open /dev/net
    LDI r0, net_path
    LDI r12, 0
    OPEN r0, r12
    MOV r6, r10            ; r6 = net fd

; == MAIN LOOP ==
main_loop:
    ; Dark background
    LDI r0, 0x080810
    FILL r0

    ; == SIMULATE PACKETS (every ~32 frames) ==
    LDI r0, 0xFFE
    LOAD r0, r0
    LDI r12, 31
    AND r0, r12
    LDI r12, 15
    CMP r0, r12
    JNZ r10, no_sim
    RAND r0
    LDI r12, 0xFFC
    STORE r12, r0
no_sim:

    ; == READ FROM /dev/net ==
    LDI r0, 0xFFC
    LDI r12, 1
    READ r6, r0, r12
    LDI r0, 0
    CMP r10, r0
    JZ r10, no_pkt

    ; Store packet
    LDI r0, 0xFFC
    LOAD r24, r0           ; data word

    ; Buffer[head*4 + 0] = data
    MOV r0, r1
    LDI r12, 2
    SHL r0, r12
    MOV r12, r22
    ADD r12, r0
    STORE r12, r24

    ; Buffer[head*4 + 1] = top byte (for color)
    MOV r0, r15
    ADD r12, r0
    MOV r7, r24
    LDI r9, 24
    SHR r7, r9             ; top byte
    STORE r12, r7

    ; Buffer[head*4 + 2] = TICKS at receipt
    MOV r0, r15
    ADD r12, r0
    LDI r7, 0xFFE
    LOAD r7, r7
    STORE r12, r7

    ; Advance head
    ADD r1, r15
    LDI r0, 32
    CMP r1, r0
    BLT r10, no_wrap
    LDI r1, 0
no_wrap:
    ADD r5, r15
    ADD r3, r15

no_pkt:
    ; == RATE UPDATE ==
    LDI r0, 0xFFE
    LOAD r4, r0
    LDI r0, 63
    AND r4, r0
    LDI r0, 2
    CMP r4, r0
    BGE r10, no_rate
    MOV r13, r3
    LDI r3, 0
no_rate:

    ; == TITLE BAR ==
    LDI r0, 0
    LDI r12, 0
    LDI r7, 256
    LDI r9, 14
    LDI r8, 0x003366
    RECTF r0, r12, r7, r9, r8

    LDI r16, 4
    LDI r17, 3
    LDI r18, title_str
    LDI r19, 0xFFFFFF
    LDI r20, 0x003366
    DRAWTEXT r16, r17, r18, r19, r20

    ; Net status indicator
    LDI r0, 0xE003
    LDI r12, 0
    LDI r7, 0
    IOCTL r0, r12, r7
    LDI r0, 0
    CMP r10, r0
    JZ r10, net_down_label

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
    LDI r0, 0
    CMP r5, r0
    JZ r10, show_empty

    ; Determine entry index
    LDI r0, 28
    CMP r5, r0
    BGE r10, full_buf
    ; Partial: show rows 0..total-1
    CMP r25, r5
    BLT r10, do_draw_entry
    JMP skip_row

full_buf:
    ; entry = (head - 28 + row) & 31
    MOV r0, r1
    LDI r12, 28
    SUB r0, r12
    ADD r0, r25
    LDI r12, 31
    AND r0, r12

do_draw_entry:
    ; r0 = entry index
    LDI r12, 2
    SHL r0, r12             ; entry * 4
    MOV r7, r22
    ADD r7, r0             ; buffer base + offset

    ; Load color byte (word 1)
    MOV r12, r7
    ADD r12, r15
    LOAD r8, r12           ; color index (top byte of data)

    ; Generate color from the byte: hue mapping
    ; Use top 3 bits for hue channel selection
    LDI r9, 0xE0
    AND r8, r9            ; top 3 bits
    LDI r9, 5
    SHR r8, r9            ; shift to bits 8-10 range
    ; Create a visible color
    LDI r9, 0x44
    OR r8, r9             ; ensure minimum brightness

    ; Draw row bar
    LDI r0, 2
    LDI r12, 256
    LDI r9, 7
    RECTF r0, r17, r12, r9, r8

    ; Draw a bright accent line on left
    MOV r0, r7
    LOAD r2, r0           ; data word
    LDI r4, 16
    SHR r2, r4
    LDI r4, 0xF
    AND r2, r4
    LDI r4, 2
    MUL r2, r4
    ADD r2, r15             ; width = 3..33
    LDI r4, 0x00CCFF      ; cyan accent
    RECTF r0, r17, r2, r9, r4

skip_row:
    LDI r0, 8
    ADD r17, r0
    ADD r25, r15
    LDI r0, 28
    CMP r25, r0
    BLT r10, pkt_row
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
    LDI r0, 0
    LDI r12, 242
    LDI r7, 256
    LDI r9, 14
    LDI r8, 0x002244
    RECTF r0, r12, r7, r9, r8

    ; Build "PKT:N" at 0x6000
    LDI r0, 0x6000
    LDI r8, 80            ; 'P'
    STORE r0, r8
    ADD r0, r15
    LDI r8, 75
    STORE r0, r8
    ADD r0, r15
    LDI r8, 84
    STORE r0, r8
    ADD r0, r15
    LDI r8, 58
    STORE r0, r8
    ADD r0, r15
    LDI r8, 32
    STORE r0, r8
    ADD r0, r15

    ; Decimal convert r5
    MOV r12, r5
    LDI r7, 0x6020
    LDI r8, 0
    STORE r7, r8
    ; Special case: if r5 == 0, write '0'
    LDI r8, 0
    CMP r12, r8
    JNZ r10, dec_nonzero
    LDI r8, 48
    SUB r7, r15
    STORE r7, r8
    JMP dec_copy
dec_nonzero:
    LDI r27, 10
    MOV r28, r12
    DIV r28, r27
    MUL r28, r27
    MOV r29, r12
    SUB r29, r28
    LDI r28, 48
    ADD r29, r28
    SUB r7, r15
    STORE r7, r29
    LDI r28, 10
    DIV r12, r28
    LDI r28, 0
    CMP r12, r28
    JNZ r10, dec_nonzero
dec_copy:
    LDI r0, 0x6005
dec_cp:
    LOAD r12, r7
    LDI r27, 0
    CMP r12, r27
    JZ r10, dec_cp_done
    STORE r0, r12
    ADD r0, r15
    ADD r7, r15
    JMP dec_cp
dec_cp_done:
    LDI r8, 0
    STORE r0, r8

    LDI r16, 4
    LDI r17, 244
    LDI r18, 0x6000
    LDI r19, 0xFFFFFF
    LDI r20, 0x002244
    DRAWTEXT r16, r17, r18, r19, r20

    ; Build "RATE:N/s" at 0x6030
    LDI r0, 0x6030
    LDI r8, 82
    STORE r0, r8
    ADD r0, r15
    LDI r8, 65
    STORE r0, r8
    ADD r0, r15
    LDI r8, 84
    STORE r0, r8
    ADD r0, r15
    LDI r8, 69
    STORE r0, r8
    ADD r0, r15
    LDI r8, 58
    STORE r0, r8
    ADD r0, r15
    LDI r8, 32
    STORE r0, r8
    ADD r0, r15

    ; Decimal convert r13
    MOV r12, r13
    LDI r7, 0x6050
    LDI r8, 0
    STORE r7, r8
    LDI r8, 0
    CMP r12, r8
    JNZ r10, rdec_nonzero
    LDI r8, 48
    SUB r7, r15
    STORE r7, r8
    JMP rdec_copy
rdec_nonzero:
    LDI r27, 10
    MOV r28, r12
    DIV r28, r27
    MUL r28, r27
    MOV r29, r12
    SUB r29, r28
    LDI r28, 48
    ADD r29, r28
    SUB r7, r15
    STORE r7, r29
    LDI r28, 10
    DIV r12, r28
    LDI r28, 0
    CMP r12, r28
    JNZ r10, rdec_nonzero
rdec_copy:
    LDI r0, 0x6037
rdec_cp:
    LOAD r12, r7
    LDI r27, 0
    CMP r12, r27
    JZ r10, rdec_done
    STORE r0, r12
    ADD r0, r15
    ADD r7, r15
    JMP rdec_cp
rdec_done:
    LDI r8, 47
    STORE r0, r8
    ADD r0, r15
    LDI r8, 115
    STORE r0, r8
    ADD r0, r15
    LDI r8, 0
    STORE r0, r8

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
