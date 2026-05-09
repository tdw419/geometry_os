; DESCRIPTION: Places a purple 26x51 rectangle at position (343, 14).
; PLAN: r0=343(x), r1=14(y), r2=26(width), r3=51(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 343
LDI r1, 14
LDI r2, 26
LDI r3, 51
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
