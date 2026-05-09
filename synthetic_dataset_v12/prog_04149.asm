; DESCRIPTION: Composite: Places a red circle of radius 57 at center (391, 172) then Places a green dot at position (95, 27) then Draws a blue line from (86, 222) to (432, 191).
; PLAN: r0=391(x), r1=172(y), r2=57(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=95(x), r6=27(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=86(x1), r11=222(y1), r12=432(x2), r13=191(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 391
LDI r1, 172
LDI r2, 57
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 95
LDI r6, 27
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 86
LDI r11, 222
LDI r12, 432
LDI r13, 191
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
