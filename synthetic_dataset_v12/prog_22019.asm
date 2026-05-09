; DESCRIPTION: Composite: Creates a purple rectangular region at (61, 10) spanning 12 by 108 pixels then Creates a purple circular shape at (427, 124) with radius 75 then Sets a single black pixel at (256, 50).
; PLAN: r0=61(x), r1=10(y), r2=12(width), r3=108(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=427(x), r6=124(y), r7=75(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=256(x), r11=50(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 61
LDI r1, 10
LDI r2, 12
LDI r3, 108
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 427
LDI r6, 124
LDI r7, 75
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 256
LDI r11, 50
LDI r12, 0x000000
PSET r10, r11, r12
HALT
