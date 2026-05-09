; DESCRIPTION: Places a orange 41x109 rectangle at position (49, 40).
; PLAN: r0=49(x), r1=40(y), r2=41(width), r3=109(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 40
LDI r2, 41
LDI r3, 109
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
