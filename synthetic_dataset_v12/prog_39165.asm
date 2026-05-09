; DESCRIPTION: Composite: Places a blue 67x84 rectangle at position (79, 20) then Places a yellow dot at position (278, 102) then Draws a yellow line from (455, 6) to (196, 142).
; PLAN: r0=79(x), r1=20(y), r2=67(width), r3=84(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=278(x), r6=102(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=455(x1), r11=6(y1), r12=196(x2), r13=142(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 79
LDI r1, 20
LDI r2, 67
LDI r3, 84
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 278
LDI r6, 102
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 455
LDI r11, 6
LDI r12, 196
LDI r13, 142
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
