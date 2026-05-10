; DESCRIPTION: Places a purple 116x19 box at position (365, 155).
; PLAN: r0=365(x), r1=155(y), r2=116(width), r3=19(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 365
LDI r1, 155
LDI r2, 116
LDI r3, 19
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
