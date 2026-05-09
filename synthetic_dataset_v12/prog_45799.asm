; DESCRIPTION: Renders a orange box of size 100x33 starting at (22, 167).
; PLAN: r0=22(x), r1=167(y), r2=100(width), r3=33(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 22
LDI r1, 167
LDI r2, 100
LDI r3, 33
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
