; DESCRIPTION: Renders a orange box of size 109x78 starting at (53, 7).
; PLAN: r0=53(x), r1=7(y), r2=109(width), r3=78(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 7
LDI r2, 109
LDI r3, 78
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
