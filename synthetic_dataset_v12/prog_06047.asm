; DESCRIPTION: Composite: Creates a blue circular shape at (363, 60) with radius 53 then Creates a red rectangular region at (16, 12) spanning 93 by 14 pixels then Sets a single black pixel at (395, 117).
; PLAN: r0=363(x), r1=60(y), r2=53(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=16(x), r6=12(y), r7=93(width), r8=14(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=395(x), r11=117(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 363
LDI r1, 60
LDI r2, 53
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 16
LDI r6, 12
LDI r7, 93
LDI r8, 14
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 395
LDI r11, 117
LDI r12, 0x000000
PSET r10, r11, r12
HALT
