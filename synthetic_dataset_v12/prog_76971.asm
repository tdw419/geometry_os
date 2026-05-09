; DESCRIPTION: Composite: Creates a green rectangular region at (327, 102) spanning 101 by 33 pixels then Sets a single orange pixel at (117, 132).
; PLAN: r0=327(x), r1=102(y), r2=101(width), r3=33(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=117(x), r6=132(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 327
LDI r1, 102
LDI r2, 101
LDI r3, 33
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 117
LDI r6, 132
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
