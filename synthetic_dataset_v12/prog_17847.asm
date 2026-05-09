; DESCRIPTION: Renders a orange box of size 74x69 starting at (239, 10).
; PLAN: r0=239(x), r1=10(y), r2=74(width), r3=69(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 239
LDI r1, 10
LDI r2, 74
LDI r3, 69
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
