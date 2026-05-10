; DESCRIPTION: Places a purple 55x101 box at position (261, 41).
; PLAN: r0=261(x), r1=41(y), r2=55(width), r3=101(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 261
LDI r1, 41
LDI r2, 55
LDI r3, 101
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
