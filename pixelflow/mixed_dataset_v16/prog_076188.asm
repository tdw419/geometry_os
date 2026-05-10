; DESCRIPTION: Composite: Creates a black rectangular region at (309, 106) spanning 59 by 94 pixels then Renders a yellow disk with center (117, 179) and radius 52 then Sets a single red pixel at (14, 192).
; PLAN: r0=309(x), r1=106(y), r2=59(width), r3=94(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=117(x), r6=179(y), r7=52(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=14(x), r11=192(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 309
LDI r1, 106
LDI r2, 59
LDI r3, 94
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 117
LDI r6, 179
LDI r7, 52
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 14
LDI r11, 192
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
