; DESCRIPTION: Places a orange 37x41 rectangle at position (266, 40).
; PLAN: r0=266(x), r1=40(y), r2=37(width), r3=41(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 266
LDI r1, 40
LDI r2, 37
LDI r3, 41
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
