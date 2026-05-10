; DESCRIPTION: Places a purple 45x28 box at position (151, 194).
; PLAN: r0=151(x), r1=194(y), r2=45(width), r3=28(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 194
LDI r2, 45
LDI r3, 28
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
