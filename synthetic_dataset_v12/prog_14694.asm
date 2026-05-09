; DESCRIPTION: Composite: Creates a cyan rectangular region at (50, 48) spanning 45 by 66 pixels then Sets a single blue pixel at (58, 18).
; PLAN: r0=50(x), r1=48(y), r2=45(width), r3=66(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=58(x), r6=18(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 50
LDI r1, 48
LDI r2, 45
LDI r3, 66
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 58
LDI r6, 18
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
