; DESCRIPTION: Renders a magenta box of size 105x35 starting at (85, 62).
; PLAN: r0=85(x), r1=62(y), r2=105(width), r3=35(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 85
LDI r1, 62
LDI r2, 105
LDI r3, 35
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
