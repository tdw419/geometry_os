; DESCRIPTION: Renders a orange box of size 117x95 starting at (134, 78).
; PLAN: r0=134(x), r1=78(y), r2=117(width), r3=95(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 134
LDI r1, 78
LDI r2, 117
LDI r3, 95
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
