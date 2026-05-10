; DESCRIPTION: Places a purple 106x119 rectangle at position (40, 41).
; PLAN: r0=40(x), r1=41(y), r2=106(width), r3=119(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 41
LDI r2, 106
LDI r3, 119
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
