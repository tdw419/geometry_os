; DESCRIPTION: Composite: Creates a blue rectangular region at (236, 121) spanning 89 by 73 pixels then Sets a single white pixel at (348, 80).
; PLAN: r0=236(x), r1=121(y), r2=89(width), r3=73(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=348(x), r6=80(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 236
LDI r1, 121
LDI r2, 89
LDI r3, 73
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 348
LDI r6, 80
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
