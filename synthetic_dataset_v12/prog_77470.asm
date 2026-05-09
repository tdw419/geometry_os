; DESCRIPTION: Composite: Renders a black line between points (100, 195) and (346, 143) then Places a red circle of radius 78 at center (90, 91) then Sets a single yellow pixel at (463, 0).
; PLAN: r0=100(x1), r1=195(y1), r2=346(x2), r3=143(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=90(x), r6=91(y), r7=78(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=463(x), r11=0(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 100
LDI r1, 195
LDI r2, 346
LDI r3, 143
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 90
LDI r6, 91
LDI r7, 78
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 463
LDI r11, 0
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
