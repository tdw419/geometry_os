; DESCRIPTION: Places a purple 15x19 rectangle at position (121, 88).
; PLAN: r0=121(x), r1=88(y), r2=15(width), r3=19(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 121
LDI r1, 88
LDI r2, 15
LDI r3, 19
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
