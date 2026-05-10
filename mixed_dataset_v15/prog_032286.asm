; DESCRIPTION: Composite: Creates a purple rectangular region at (7, 180) spanning 71 by 44 pixels then Sets a single blue pixel at (112, 104).
; PLAN: r0=7(x), r1=180(y), r2=71(width), r3=44(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=112(x), r6=104(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 7
LDI r1, 180
LDI r2, 71
LDI r3, 44
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 112
LDI r6, 104
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
