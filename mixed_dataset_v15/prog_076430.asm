; DESCRIPTION: Composite: Creates a blue rectangular region at (179, 184) spanning 90 by 24 pixels then Sets a single blue pixel at (404, 32).
; PLAN: r0=179(x), r1=184(y), r2=90(width), r3=24(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=404(x), r6=32(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 179
LDI r1, 184
LDI r2, 90
LDI r3, 24
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 404
LDI r6, 32
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
