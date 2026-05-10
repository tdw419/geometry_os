; DESCRIPTION: Renders a orange box of size 69x106 starting at (356, 3).
; PLAN: r0=356(x), r1=3(y), r2=69(width), r3=106(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 356
LDI r1, 3
LDI r2, 69
LDI r3, 106
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
