; DESCRIPTION: Composite: Creates a purple rectangular region at (383, 130) spanning 44 by 104 pixels then Sets a single black pixel at (252, 168).
; PLAN: r0=383(x), r1=130(y), r2=44(width), r3=104(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=252(x), r6=168(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 383
LDI r1, 130
LDI r2, 44
LDI r3, 104
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 252
LDI r6, 168
LDI r7, 0x000000
PSET r5, r6, r7
HALT
