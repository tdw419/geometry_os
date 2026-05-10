; DESCRIPTION: Composite: Draws a black circle centered at (435, 176) with radius 35 then Creates a green rectangular region at (190, 198) spanning 39 by 16 pixels then Sets a single black pixel at (86, 229).
; PLAN: r0=435(x), r1=176(y), r2=35(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=190(x), r6=198(y), r7=39(width), r8=16(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=86(x), r11=229(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 435
LDI r1, 176
LDI r2, 35
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 190
LDI r6, 198
LDI r7, 39
LDI r8, 16
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 86
LDI r11, 229
LDI r12, 0x000000
PSET r10, r11, r12
HALT
