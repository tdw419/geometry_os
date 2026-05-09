; DESCRIPTION: Places a blue 49x41 rectangle at position (252, 137).
; PLAN: r0=252(x), r1=137(y), r2=49(width), r3=41(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 252
LDI r1, 137
LDI r2, 49
LDI r3, 41
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
