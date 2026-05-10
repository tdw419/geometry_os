; DESCRIPTION: Renders a orange box of size 118x76 starting at (105, 101).
; PLAN: r0=105(x), r1=101(y), r2=118(width), r3=76(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 105
LDI r1, 101
LDI r2, 118
LDI r3, 76
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
