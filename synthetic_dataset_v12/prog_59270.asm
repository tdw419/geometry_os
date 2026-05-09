; DESCRIPTION: Composite: Creates a purple rectangular region at (73, 16) spanning 25 by 45 pixels then Sets a single yellow pixel at (331, 27).
; PLAN: r0=73(x), r1=16(y), r2=25(width), r3=45(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=331(x), r6=27(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 73
LDI r1, 16
LDI r2, 25
LDI r3, 45
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 331
LDI r6, 27
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
