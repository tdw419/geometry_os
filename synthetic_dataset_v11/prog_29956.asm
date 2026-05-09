; DESCRIPTION: Renders a orange box of size 19x105 starting at (76, 148).
; PLAN: r0=76(x), r1=148(y), r2=19(width), r3=105(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 148
LDI r2, 19
LDI r3, 105
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
