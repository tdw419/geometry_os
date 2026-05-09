; DESCRIPTION: Renders a magenta box of size 60x88 starting at (185, 137).
; PLAN: r0=185(x), r1=137(y), r2=60(width), r3=88(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 185
LDI r1, 137
LDI r2, 60
LDI r3, 88
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
