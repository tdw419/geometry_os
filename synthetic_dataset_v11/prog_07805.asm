; DESCRIPTION: Renders a magenta box of size 119x88 starting at (86, 70).
; PLAN: r0=86(x), r1=70(y), r2=119(width), r3=88(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 70
LDI r2, 119
LDI r3, 88
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
