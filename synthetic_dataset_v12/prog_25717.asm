; DESCRIPTION: Places a orange 45x114 rectangle at position (41, 35).
; PLAN: r0=41(x), r1=35(y), r2=45(width), r3=114(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 35
LDI r2, 45
LDI r3, 114
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
