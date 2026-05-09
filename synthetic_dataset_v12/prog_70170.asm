; DESCRIPTION: Places a orange 26x41 rectangle at position (13, 102).
; PLAN: r0=13(x), r1=102(y), r2=26(width), r3=41(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 102
LDI r2, 26
LDI r3, 41
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
