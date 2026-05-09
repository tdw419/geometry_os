; DESCRIPTION: Renders a orange box of size 100x24 starting at (359, 23).
; PLAN: r0=359(x), r1=23(y), r2=100(width), r3=24(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 359
LDI r1, 23
LDI r2, 100
LDI r3, 24
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
