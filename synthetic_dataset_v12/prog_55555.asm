; DESCRIPTION: Composite: Creates a green rectangular region at (21, 121) spanning 36 by 93 pixels then Sets a single magenta pixel at (351, 49).
; PLAN: r0=21(x), r1=121(y), r2=36(width), r3=93(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=351(x), r6=49(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 21
LDI r1, 121
LDI r2, 36
LDI r3, 93
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 351
LDI r6, 49
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
