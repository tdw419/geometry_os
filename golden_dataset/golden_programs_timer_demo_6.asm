; DESCRIPTION: Geometry OS program to draw a colored object.

; timer_demo.asm -- Phase 222: Wall-Clock Timer & Alarm Demo
; Demonstrates TMR_GET, TMR_WAIT, ALARM_SET, ALARM_CLR
;
; Visual output:
;   - Top bar: elapsed milliseconds since start (bar height)
;   - Bottom marker: alarm fire indicator (green pixel at row 20)
;   - Dot row: last hex digit of elapsed ms

; --- Part 1: TMR_GET baseline ---
TMR_GET r13

; --- Part 2: TMR_WAIT 200ms ---
IMM r12, 200
TMR_WAIT r12

; --- Part 3: TMR_GET again, compute delta ---
TMR_GET r5
SUB r7, r5, r13

; --- Part 4: Visualize elapsed time as vertical bar ---
; Bar at x=2, height = min(r7/10, 30), color=4 (blue)
DIV r0, r7, 10
IMM r9, 30
CMP r0, r9
JGE r0, r9, cap_height
JMP draw_bar
cap_height:
MOV r0, r9
draw_bar:
IMM r1, 2       ; x
IMM r10, 0      ; y
bar_loop:
CMP r0, 0
JEQ r0, 0, bar_done
PXL r1, r10, 4
INC r10
DEC r0
JMP bar_loop
bar_done:

; --- Part 5: Set alarm for 100ms, writes 99 to RAM[0xF00] ---
IMM r11, 100    ; delay ms
IMM r4, 0xF00  ; RAM address
IMM r14, 99     ; value to write
ALARM_SET r11, r4, r14

; --- Part 6: Spin until alarm fires ---
alarm_wait:
FRAME
LOAD r6, 0xF00
CMP r6, 99
JNE r6, 99, alarm_wait

; --- Part 7: Alarm fired! Mark success ---
IMM r2, 5      ; x
IMM r16, 20     ; y (bottom area)
PXL r2, r16, 2 ; green pixel

; --- Part 8: Show last hex digit of elapsed ms as dots ---
AND r20, r7, 0xF
IMM r21, 8      ; start x for dots
IMM r22, 20     ; y (same row as alarm marker)
dot_loop:
CMP r20, 0
JEQ r20, 0, dots_done
PXL r21, r22, 12 ; bright red dots
INC r21
DEC r20
JMP dot_loop
dots_done:

; --- Part 9: Clear the alarm slot ---
IMM r17, 0
ALARM_CLR r17

FRAME
HALT
