; DESCRIPTION: Renders a orange box of size 33x100 starting at (55, 22).
; PLAN: r0=55(x), r1=22(y), r2=33(width), r3=100(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 55
LDI r1, 22
LDI r2, 33
LDI r3, 100
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
