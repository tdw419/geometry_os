; DESCRIPTION: Renders a orange box of size 41x63 starting at (332, 184).
; PLAN: r0=332(x), r1=184(y), r2=41(width), r3=63(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 332
LDI r1, 184
LDI r2, 41
LDI r3, 63
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
