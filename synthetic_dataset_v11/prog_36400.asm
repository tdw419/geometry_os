; DESCRIPTION: Places a purple 51x11 rectangle at position (14, 88).
; PLAN: r0=14(x), r1=88(y), r2=51(width), r3=11(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 14
LDI r1, 88
LDI r2, 51
LDI r3, 11
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
