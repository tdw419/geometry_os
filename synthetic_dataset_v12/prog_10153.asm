; DESCRIPTION: Composite: Renders a black box of size 105x79 starting at (265, 20) then Renders a white disk with center (321, 109) and radius 34 then Sets a single yellow pixel at (84, 148).
; PLAN: r0=265(x), r1=20(y), r2=105(width), r3=79(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=321(x), r6=109(y), r7=34(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=84(x), r11=148(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 265
LDI r1, 20
LDI r2, 105
LDI r3, 79
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 321
LDI r6, 109
LDI r7, 34
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 84
LDI r11, 148
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
