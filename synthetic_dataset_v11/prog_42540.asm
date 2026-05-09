; DESCRIPTION: Renders a orange box of size 88x101 starting at (16, 93).
; PLAN: r0=16(x), r1=93(y), r2=88(width), r3=101(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 16
LDI r1, 93
LDI r2, 88
LDI r3, 101
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
