; DESCRIPTION: Renders a orange box of size 62x52 starting at (111, 41).
; PLAN: r0=111(x), r1=41(y), r2=62(width), r3=52(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 111
LDI r1, 41
LDI r2, 62
LDI r3, 52
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
