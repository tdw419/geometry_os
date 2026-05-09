; DESCRIPTION: Renders a orange box of size 69x101 starting at (125, 118).
; PLAN: r0=125(x), r1=118(y), r2=69(width), r3=101(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 118
LDI r2, 69
LDI r3, 101
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
