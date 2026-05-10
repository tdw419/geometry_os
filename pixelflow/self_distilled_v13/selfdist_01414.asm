; DESCRIPTION: Places a magenta 41x13 box at position (49, 67).
; PLAN: r0=49(x), r1=67(y), r2=41(width), r3=13(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 67
LDI r2, 41
LDI r3, 13
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
