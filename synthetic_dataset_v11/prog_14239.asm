; DESCRIPTION: Places a orange 12x26 rectangle at position (40, 41).
; PLAN: r0=40(x), r1=41(y), r2=12(width), r3=26(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 41
LDI r2, 12
LDI r3, 26
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
