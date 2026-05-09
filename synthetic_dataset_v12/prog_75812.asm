; DESCRIPTION: Composite: Creates a magenta rectangular region at (210, 39) spanning 26 by 105 pixels then Sets a single green pixel at (163, 64).
; PLAN: r0=210(x), r1=39(y), r2=26(width), r3=105(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=163(x), r6=64(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 210
LDI r1, 39
LDI r2, 26
LDI r3, 105
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 163
LDI r6, 64
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
