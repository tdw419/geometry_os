; DESCRIPTION: Renders a orange box of size 49x39 starting at (33, 136).
; PLAN: r0=33(x), r1=136(y), r2=49(width), r3=39(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 136
LDI r2, 49
LDI r3, 39
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
