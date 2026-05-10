; DESCRIPTION: Composite: Renders a cyan line between points (448, 164) and (263, 230) then Places a green dot at position (472, 88) then Places a yellow circle of radius 23 at center (358, 233).
; PLAN: r0=448(x1), r1=164(y1), r2=263(x2), r3=230(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=472(x), r6=88(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=358(x), r11=233(y), r12=23(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 448
LDI r1, 164
LDI r2, 263
LDI r3, 230
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 472
LDI r6, 88
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 358
LDI r11, 233
LDI r12, 23
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
