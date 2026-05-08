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
    LDI r7, 1
    LDI r14, 0
    LDI r15, 0             ; total packets
    LDI r11, 0            ; rate counter
    LDI r13, 0            ; displayed rate
    LDI r0, 0            ; buffer head (0-31)
    LDI r22, 0x5000       ; packet buffer (32 entries, 4 words each)
    LDI r23, 32           ; max packets

    ; Open /dev/net
    LDI r1, net_path
    LDI r5, 0
    OPEN r1, r5
    MOV r6, r3            ; r6 = net fd

; == MAIN LOOP ==
main_loop:
    ; Dark background
    LDI r1, 0x080810
    FILL r1

    ; == SIMULATE PACKETS (every ~32 frames) ==
    LDI r1, 0xFFE
    LOAD r1, r1
    LDI r5, 31
    AND r1, r5
    LDI r5, 15
    CMP r1, r5
    JNZ r3, no_sim
    RAND r1
    LDI r5, 0xFFC
    STORE r5, r1
no_sim:

    ; == READ FROM /dev/net ==
    LDI r1, 0xFFC
    LDI r5, 1
    READ r6, r1, r5
    LDI r1, 0
    CMP r3, r1
    JZ r3, no_pkt

    ; Store packet
    LDI r1, 0xFFC
    LOAD r24, r1           ; data word

    ; Buffer[head*4 + 0] = data
    MOV r1, r0
    LDI r5, 2
    SHL r1, r5
    MOV r5, r22
    ADD r5, r1
    STORE r5, r24

    ; Buffer[head*4 + 1] = top byte (for color)
    MOV r1, r7
    ADD r5, r1
    MOV r10, r24
    LDI r4, 24
    SHR r10, r4             ; top byte
    STORE r5, r10

    ; Buffer[head*4 + 2] = TICKS at receipt
    MOV r1, r7
    ADD r5, r1
    LDI r10, 0xFFE
    LOAD r10, r10
    STORE r5, r10

    ; Advance head
    ADD r0, r7
    LDI r1, 32
    CMP r0, r1
    BLT r3, no_wrap
    LDI r0, 0
no_wrap:
    ADD r15, r7
    ADD r11, r7

no_pkt:
    ; == RATE UPDATE ==
    LDI r1, 0xFFE
    LOAD r9, r1
    LDI r1, 63
    AND r9, r1
    LDI r1, 2
    CMP r9, r1
    BGE r3, no_rate
    MOV r13, r11
    LDI r11, 0
no_rate:

    ; == TITLE BAR ==
    LDI r1, 0
    LDI r5, 0
    LDI r10, 256
    LDI r4, 14
    LDI r8, 0x003366
    RECTF r1, r5, r10, r4, r8

    LDI r16, 4
    LDI r17, 3
    LDI r18, title_str
    LDI r19, 0xFFFFFF
    LDI r20, 0x003366
    DRAWTEXT r16, r17, r18, r19, r20

    ; Net status indicator
    LDI r1, 0xE003
    LDI r5, 0
    LDI r10, 0
    IOCTL r1, r5, r10
    LDI r1, 0
    CMP r3, r1
    JZ r3, net_down_label

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
    LDI r1, 0
    CMP r15, r1
    JZ r3, show_empty

    ; Determine entry index
    LDI r1, 28
    CMP r15, r1
    BGE r3, full_buf
    ; Partial: show rows 0..total-1
    CMP r25, r15
    BLT r3, do_draw_entry
    JMP skip_row

full_buf:
    ; entry = (head - 28 + row) & 31
    MOV r1, r0
    LDI r5, 28
    SUB r1, r5
    ADD r1, r25
    LDI r5, 31
    AND r1, r5

do_draw_entry:
    ; r1 = entry index
    LDI r5, 2
    SHL r1, r5             ; entry * 4
    MOV r10, r22
    ADD r10, r1             ; buffer base + offset

    ; Load color byte (word 1)
    MOV r5, r10
    ADD r5, r7
    LOAD r8, r5           ; color index (top byte of data)

    ; Generate color from the byte: hue mapping
    ; Use top 3 bits for hue channel selection
    LDI r4, 0xE0
    AND r8, r4            ; top 3 bits
    LDI r4, 5
    SHR r8, r4            ; shift to bits 8-10 range
    ; Create a visible color
    LDI r4, 0x44
    OR r8, r4             ; ensure minimum brightness

    ; Draw row bar
    LDI r1, 2
    LDI r5, 256
    LDI r4, 7
    RECTF r1, r17, r5, r4, r8

    ; Draw a bright accent line on left
    MOV r1, r10
    LOAD r12, r1           ; data word
    LDI r9, 16
    SHR r12, r9
    LDI r9, 0xF
    AND r12, r9
    LDI r9, 2
    MUL r12, r9
    ADD r12, r7             ; width = 3..33
    LDI r9, 0x00CCFF      ; cyan accent
    RECTF r1, r17, r12, r4, r9

skip_row:
    LDI r1, 8
    ADD r17, r1
    ADD r25, r7
    LDI r1, 28
    CMP r25, r1
    BLT r3, pkt_row
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
    LDI r1, 0
    LDI r5, 242
    LDI r10, 256
    LDI r4, 14
    LDI r8, 0x002244
    RECTF r1, r5, r10, r4, r8

    ; Build "PKT:N" at 0x6000
    LDI r1, 0x6000
    LDI r8, 80            ; 'P'
    STORE r1, r8
    ADD r1, r7
    LDI r8, 75
    STORE r1, r8
    ADD r1, r7
    LDI r8, 84
    STORE r1, r8
    ADD r1, r7
    LDI r8, 58
    STORE r1, r8
    ADD r1, r7
    LDI r8, 32
    STORE r1, r8
    ADD r1, r7

    ; Decimal convert r15
    MOV r5, r15
    LDI r10, 0x6020
    LDI r8, 0
    STORE r10, r8
    ; Special case: if r15 == 0, write '0'
    LDI r8, 0
    CMP r5, r8
    JNZ r3, dec_nonzero
    LDI r8, 48
    SUB r10, r7
    STORE r10, r8
    JMP dec_copy
dec_nonzero:
    LDI r27, 10
    MOV r28, r5
    DIV r28, r27
    MUL r28, r27
    MOV r29, r5
    SUB r29, r28
    LDI r28, 48
    ADD r29, r28
    SUB r10, r7
    STORE r10, r29
    LDI r28, 10
    DIV r5, r28
    LDI r28, 0
    CMP r5, r28
    JNZ r3, dec_nonzero
dec_copy:
    LDI r1, 0x6005
dec_cp:
    LOAD r5, r10
    LDI r27, 0
    CMP r5, r27
    JZ r3, dec_cp_done
    STORE r1, r5
    ADD r1, r7
    ADD r10, r7
    JMP dec_cp
dec_cp_done:
    LDI r8, 0
    STORE r1, r8

    LDI r16, 4
    LDI r17, 244
    LDI r18, 0x6000
    LDI r19, 0xFFFFFF
    LDI r20, 0x002244
    DRAWTEXT r16, r17, r18, r19, r20

    ; Build "RATE:N/s" at 0x6030
    LDI r1, 0x6030
    LDI r8, 82
    STORE r1, r8
    ADD r1, r7
    LDI r8, 65
    STORE r1, r8
    ADD r1, r7
    LDI r8, 84
    STORE r1, r8
    ADD r1, r7
    LDI r8, 69
    STORE r1, r8
    ADD r1, r7
    LDI r8, 58
    STORE r1, r8
    ADD r1, r7
    LDI r8, 32
    STORE r1, r8
    ADD r1, r7

    ; Decimal convert r13
    MOV r5, r13
    LDI r10, 0x6050
    LDI r8, 0
    STORE r10, r8
    LDI r8, 0
    CMP r5, r8
    JNZ r3, rdec_nonzero
    LDI r8, 48
    SUB r10, r7
    STORE r10, r8
    JMP rdec_copy
rdec_nonzero:
    LDI r27, 10
    MOV r28, r5
    DIV r28, r27
    MUL r28, r27
    MOV r29, r5
    SUB r29, r28
    LDI r28, 48
    ADD r29, r28
    SUB r10, r7
    STORE r10, r29
    LDI r28, 10
    DIV r5, r28
    LDI r28, 0
    CMP r5, r28
    JNZ r3, rdec_nonzero
rdec_copy:
    LDI r1, 0x6037
rdec_cp:
    LOAD r5, r10
    LDI r27, 0
    CMP r5, r27
    JZ r3, rdec_done
    STORE r1, r5
    ADD r1, r7
    ADD r10, r7
    JMP rdec_cp
rdec_done:
    LDI r8, 47
    STORE r1, r8
    ADD r1, r7
    LDI r8, 115
    STORE r1, r8
    ADD r1, r7
    LDI r8, 0
    STORE r1, r8

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
