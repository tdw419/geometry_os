; DESCRIPTION: Composite: Places a blue circle of radius 68 at center (84, 144) then Places a yellow dot at position (357, 145) then Draws a green line from (92, 217) to (411, 117).
; PLAN: r0=84(x), r1=144(y), r2=68(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=357(x), r6=145(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=92(x1), r11=217(y1), r12=411(x2), r13=117(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 84
LDI r1, 144
LDI r2, 68
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 357
LDI r6, 145
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 92
LDI r11, 217
LDI r12, 411
LDI r13, 117
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
