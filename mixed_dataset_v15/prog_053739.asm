; DESCRIPTION: Places a orange 91x41 rectangle at position (211, 2).
; PLAN: r0=211(x), r1=2(y), r2=91(width), r3=41(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 211
LDI r1, 2
LDI r2, 91
LDI r3, 41
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
