; DESCRIPTION: Composite: Creates a purple rectangular region at (109, 48) spanning 90 by 30 pixels then Places a orange circle of radius 49 at center (267, 139).
; PLAN: r0=109(x), r1=48(y), r2=90(width), r3=30(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=267(x), r6=139(y), r7=49(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 109
LDI r1, 48
LDI r2, 90
LDI r3, 30
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 267
LDI r6, 139
LDI r7, 49
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
