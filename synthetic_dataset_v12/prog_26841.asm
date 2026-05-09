; DESCRIPTION: Renders a orange box of size 41x81 starting at (44, 89).
; PLAN: r0=44(x), r1=89(y), r2=41(width), r3=81(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 89
LDI r2, 41
LDI r3, 81
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
