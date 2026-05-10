; DESCRIPTION: Composite: Places a magenta circle of radius 41 at center (215, 205) then Renders a black line between points (288, 88) and (388, 80) then Sets a single green pixel at (334, 44).
; PLAN: r0=215(x), r1=205(y), r2=41(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=288(x1), r6=88(y1), r7=388(x2), r8=80(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=334(x), r11=44(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 215
LDI r1, 205
LDI r2, 41
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 288
LDI r6, 88
LDI r7, 388
LDI r8, 80
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 334
LDI r11, 44
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
