; DESCRIPTION: Composite: Renders a cyan line between points (242, 20) and (310, 163) then Creates a purple circular shape at (88, 114) with radius 79 then Sets a single red pixel at (499, 230).
; PLAN: r0=242(x1), r1=20(y1), r2=310(x2), r3=163(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=88(x), r6=114(y), r7=79(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=499(x), r11=230(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 242
LDI r1, 20
LDI r2, 310
LDI r3, 163
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 88
LDI r6, 114
LDI r7, 79
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 499
LDI r11, 230
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
