; DESCRIPTION: Places a purple 13x50 rectangle at position (41, 67).
; PLAN: r0=41(x), r1=67(y), r2=13(width), r3=50(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 67
LDI r2, 13
LDI r3, 50
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
