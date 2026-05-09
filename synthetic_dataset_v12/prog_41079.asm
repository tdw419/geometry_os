; DESCRIPTION: Places a yellow 81x118 rectangle at position (121, 73).
; PLAN: r0=121(x), r1=73(y), r2=81(width), r3=118(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 121
LDI r1, 73
LDI r2, 81
LDI r3, 118
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
