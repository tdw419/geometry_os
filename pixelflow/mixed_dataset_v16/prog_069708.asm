; DESCRIPTION: Composite: Places a green dot at position (328, 40) then Renders a blue line between points (55, 33) and (48, 88) then Creates a magenta rectangular region at (97, 166) spanning 26 by 15 pixels.
; PLAN: r0=328(x), r1=40(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=55(x1), r6=33(y1), r7=48(x2), r8=88(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=97(x), r11=166(y), r12=26(width), r13=15(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 328
LDI r1, 40
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 55
LDI r6, 33
LDI r7, 48
LDI r8, 88
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 97
LDI r11, 166
LDI r12, 26
LDI r13, 15
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
