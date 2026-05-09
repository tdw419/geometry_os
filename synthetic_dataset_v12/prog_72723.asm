; DESCRIPTION: Composite: Creates a orange rectangular region at (188, 136) spanning 92 by 112 pixels then Sets a single blue pixel at (304, 62).
; PLAN: r0=188(x), r1=136(y), r2=92(width), r3=112(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=304(x), r6=62(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 188
LDI r1, 136
LDI r2, 92
LDI r3, 112
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 304
LDI r6, 62
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
