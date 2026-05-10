; DESCRIPTION: Composite: Creates a yellow rectangular region at (372, 68) spanning 101 by 47 pixels then Sets a single blue pixel at (56, 178).
; PLAN: r0=372(x), r1=68(y), r2=101(width), r3=47(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=56(x), r6=178(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 372
LDI r1, 68
LDI r2, 101
LDI r3, 47
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 56
LDI r6, 178
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
