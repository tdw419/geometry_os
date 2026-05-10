; DESCRIPTION: Places a purple 41x101 rectangle at position (118, 3).
; PLAN: r0=118(x), r1=3(y), r2=41(width), r3=101(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 118
LDI r1, 3
LDI r2, 41
LDI r3, 101
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
