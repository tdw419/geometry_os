; DESCRIPTION: Renders a orange box of size 49x20 starting at (189, 72).
; PLAN: r0=189(x), r1=72(y), r2=49(width), r3=20(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 189
LDI r1, 72
LDI r2, 49
LDI r3, 20
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
