; DESCRIPTION: Renders a magenta box of size 70x118 starting at (9, 62).
; PLAN: r0=9(x), r1=62(y), r2=70(width), r3=118(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 9
LDI r1, 62
LDI r2, 70
LDI r3, 118
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
