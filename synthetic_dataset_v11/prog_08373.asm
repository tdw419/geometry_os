; DESCRIPTION: Places a purple 118x108 rectangle at position (27, 41).
; PLAN: r0=27(x), r1=41(y), r2=118(width), r3=108(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 27
LDI r1, 41
LDI r2, 118
LDI r3, 108
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
