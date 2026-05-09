; DESCRIPTION: Places a purple 88x81 rectangle at position (74, 155).
; PLAN: r0=74(x), r1=155(y), r2=88(width), r3=81(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 155
LDI r2, 88
LDI r3, 81
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
