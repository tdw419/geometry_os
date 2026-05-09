; DESCRIPTION: Places a orange 12x41 rectangle at position (5, 22).
; PLAN: r0=5(x), r1=22(y), r2=12(width), r3=41(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 5
LDI r1, 22
LDI r2, 12
LDI r3, 41
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
