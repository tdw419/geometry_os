; DESCRIPTION: Places a purple 58x73 box at position (348, 56).
; PLAN: r0=348(x), r1=56(y), r2=58(width), r3=73(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 348
LDI r1, 56
LDI r2, 58
LDI r3, 73
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
