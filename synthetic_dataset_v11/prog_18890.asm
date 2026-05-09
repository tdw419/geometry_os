; DESCRIPTION: Renders a orange box of size 100x43 starting at (108, 52).
; PLAN: r0=108(x), r1=52(y), r2=100(width), r3=43(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 52
LDI r2, 100
LDI r3, 43
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
