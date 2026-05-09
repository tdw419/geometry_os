; DESCRIPTION: Renders a orange box of size 20x62 starting at (33, 1).
; PLAN: r0=33(x), r1=1(y), r2=20(width), r3=62(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 1
LDI r2, 20
LDI r3, 62
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
