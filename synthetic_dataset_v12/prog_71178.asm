; DESCRIPTION: Composite: Places a purple 116x25 rectangle at position (105, 7) then Sets a single white pixel at (7, 112).
; PLAN: r0=105(x), r1=7(y), r2=116(width), r3=25(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=7(x), r6=112(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 105
LDI r1, 7
LDI r2, 116
LDI r3, 25
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 7
LDI r6, 112
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
