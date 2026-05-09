; DESCRIPTION: Composite: Creates a purple rectangular region at (161, 9) spanning 53 by 16 pixels then Sets a single red pixel at (218, 97).
; PLAN: r0=161(x), r1=9(y), r2=53(width), r3=16(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=218(x), r6=97(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 161
LDI r1, 9
LDI r2, 53
LDI r3, 16
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 218
LDI r6, 97
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
