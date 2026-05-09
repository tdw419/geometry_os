; DESCRIPTION: Composite: Renders a cyan line between points (51, 219) and (155, 167) then Places a blue dot at position (258, 250) then Creates a blue rectangular region at (24, 2) spanning 57 by 117 pixels.
; PLAN: r0=51(x1), r1=219(y1), r2=155(x2), r3=167(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=258(x), r6=250(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=24(x), r11=2(y), r12=57(width), r13=117(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 51
LDI r1, 219
LDI r2, 155
LDI r3, 167
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 258
LDI r6, 250
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 24
LDI r11, 2
LDI r12, 57
LDI r13, 117
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
