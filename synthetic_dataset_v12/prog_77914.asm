; DESCRIPTION: Renders a orange box of size 68x63 starting at (41, 178).
; PLAN: r0=41(x), r1=178(y), r2=68(width), r3=63(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 178
LDI r2, 68
LDI r3, 63
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
