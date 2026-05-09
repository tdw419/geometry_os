; DESCRIPTION: Renders a orange box of size 108x60 starting at (41, 45).
; PLAN: r0=41(x), r1=45(y), r2=108(width), r3=60(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 45
LDI r2, 108
LDI r3, 60
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
