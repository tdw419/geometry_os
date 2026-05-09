; DESCRIPTION: Renders a orange box of size 69x69 starting at (169, 31).
; PLAN: r0=169(x), r1=31(y), r2=69(width), r3=69(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 169
LDI r1, 31
LDI r2, 69
LDI r3, 69
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
