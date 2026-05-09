; DESCRIPTION: Renders a orange box of size 59x75 starting at (62, 100).
; PLAN: r0=62(x), r1=100(y), r2=59(width), r3=75(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 62
LDI r1, 100
LDI r2, 59
LDI r3, 75
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
