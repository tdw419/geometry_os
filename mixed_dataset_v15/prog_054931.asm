; DESCRIPTION: Renders a magenta box of size 20x62 starting at (69, 26).
; PLAN: r0=69(x), r1=26(y), r2=20(width), r3=62(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 26
LDI r2, 20
LDI r3, 62
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
