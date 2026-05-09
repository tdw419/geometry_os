; DESCRIPTION: Composite: Creates a purple rectangular region at (223, 110) spanning 120 by 107 pixels then Sets a single purple pixel at (145, 189).
; PLAN: r0=223(x), r1=110(y), r2=120(width), r3=107(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=145(x), r6=189(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 223
LDI r1, 110
LDI r2, 120
LDI r3, 107
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 145
LDI r6, 189
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
