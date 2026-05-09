; DESCRIPTION: Composite: Creates a purple rectangular region at (153, 73) spanning 81 by 75 pixels then Sets a single white pixel at (18, 237).
; PLAN: r0=153(x), r1=73(y), r2=81(width), r3=75(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=18(x), r6=237(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 153
LDI r1, 73
LDI r2, 81
LDI r3, 75
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 18
LDI r6, 237
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
