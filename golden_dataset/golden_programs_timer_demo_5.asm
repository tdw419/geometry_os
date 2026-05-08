; DESCRIPTION: Render a colored object at the screen.

; timer_demo.asm -- Phase 222: Wall-Clock Timer & Alarm Demo
; Demonstrates TMR_GET, TMR_WAIT, ALARM_SET, ALARM_CLR
;
; Visual output:
;   - Top bar: elapsed milliseconds since start (bar height)
;   - Bottom marker: alarm fire indicator (green pixel at row 20)
;   - Dot row: last hex digit of elapsed ms

; --- Part 1: TMR_GET baseline ---
TMR_GET r11

; --- Part 2: TMR_WAIT 200ms ---
IMM r8, 200
TMR_WAIT r8

; --- Part 3: TMR_GET again, compute delta ---
TMR_GET r9
SUB r6, r9, r11

; --- Part 4: Visualize elapsed time as vertical bar ---
; Bar at x=2, height = min(r6/10, 30), color=4 (blue)
DIV r4, r6, 10
IMM r3, 30
CMP r4, r3
JGE r4, r3, cap_height
JMP draw_bar
cap_height:
MOV r4, r3
draw_bar:
IMM r15, 2       ; x
IMM r5, 0      ; y
bar_loop:
CMP r4, 0
JEQ r4, 0, bar_done
PXL r15, r5, 4
INC r5
DEC r4
JMP bar_loop
bar_done:

; --- Part 5: Set alarm for 100ms, writes 99 to RAM[0xF00] ---
IMM r12, 100    ; delay ms
IMM r0, 0xF00  ; RAM address
IMM r1, 99     ; value to write
ALARM_SET r12, r0, r1

; --- Part 6: Spin until alarm fires ---
alarm_wait:
FRAME
LOAD r10, 0xF00
CMP r10, 99
JNE r10, 99, alarm_wait

; --- Part 7: Alarm fired! Mark success ---
IMM r7, 5      ; x
IMM r16, 20     ; y (bottom area)
PXL r7, r16, 2 ; green pixel

; --- Part 8: Show last hex digit of elapsed ms as dots ---
AND r20, r6, 0xF
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
