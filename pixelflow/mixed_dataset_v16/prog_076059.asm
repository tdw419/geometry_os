; DESCRIPTION: Places a purple 41x54 box at position (131, 158).
; PLAN: r0=131(x), r1=158(y), r2=41(width), r3=54(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 131
LDI r1, 158
LDI r2, 41
LDI r3, 54
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
