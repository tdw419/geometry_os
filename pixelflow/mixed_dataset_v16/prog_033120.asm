; DESCRIPTION: Composite: Creates a purple rectangular region at (161, 54) spanning 81 by 80 pixels then Sets a single purple pixel at (107, 76).
; PLAN: r0=161(x), r1=54(y), r2=81(width), r3=80(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=107(x), r6=76(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 161
LDI r1, 54
LDI r2, 81
LDI r3, 80
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 107
LDI r6, 76
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
