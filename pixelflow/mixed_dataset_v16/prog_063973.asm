; DESCRIPTION: Composite: Places a yellow dot at position (2, 4) then Renders a magenta line between points (362, 48) and (356, 199) then Draws a blue rectangle at (389, 119) with width 20 and height 48.
; PLAN: r0=2(x), r1=4(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=362(x1), r6=48(y1), r7=356(x2), r8=199(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=389(x), r11=119(y), r12=20(width), r13=48(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 2
LDI r1, 4
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 362
LDI r6, 48
LDI r7, 356
LDI r8, 199
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 389
LDI r11, 119
LDI r12, 20
LDI r13, 48
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
