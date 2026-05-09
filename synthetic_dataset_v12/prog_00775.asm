; DESCRIPTION: Places a purple 60x21 rectangle at position (41, 95).
; PLAN: r0=41(x), r1=95(y), r2=60(width), r3=21(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 95
LDI r2, 60
LDI r3, 21
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
