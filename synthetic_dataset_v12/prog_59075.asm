; DESCRIPTION: Composite: Renders a red line between points (139, 255) and (491, 86) then Sets a single white pixel at (76, 254).
; PLAN: r0=139(x1), r1=255(y1), r2=491(x2), r3=86(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=76(x), r6=254(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 139
LDI r1, 255
LDI r2, 491
LDI r3, 86
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 76
LDI r6, 254
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
