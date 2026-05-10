; DESCRIPTION: Places a orange 70x108 rectangle at position (291, 41).
; PLAN: r0=291(x), r1=41(y), r2=70(width), r3=108(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 291
LDI r1, 41
LDI r2, 70
LDI r3, 108
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
