; DESCRIPTION: Places a purple 70x106 rectangle at position (157, 41).
; PLAN: r0=157(x), r1=41(y), r2=70(width), r3=106(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 157
LDI r1, 41
LDI r2, 70
LDI r3, 106
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
