; DESCRIPTION: Places a orange 85x85 rectangle at position (86, 41).
; PLAN: r0=86(x), r1=41(y), r2=85(width), r3=85(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 41
LDI r2, 85
LDI r3, 85
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
