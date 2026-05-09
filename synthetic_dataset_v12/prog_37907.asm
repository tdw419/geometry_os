; DESCRIPTION: Composite: Places a purple 37x43 rectangle at position (232, 171) then Sets a single purple pixel at (348, 9).
; PLAN: r0=232(x), r1=171(y), r2=37(width), r3=43(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=348(x), r6=9(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 232
LDI r1, 171
LDI r2, 37
LDI r3, 43
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 348
LDI r6, 9
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
