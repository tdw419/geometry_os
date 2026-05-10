; DESCRIPTION: Places a orange 67x119 rectangle at position (432, 137).
; PLAN: r0=432(x), r1=137(y), r2=67(width), r3=119(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 432
LDI r1, 137
LDI r2, 67
LDI r3, 119
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
