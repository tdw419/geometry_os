; DESCRIPTION: Renders a magenta box of size 12x88 starting at (356, 148).
; PLAN: r0=356(x), r1=148(y), r2=12(width), r3=88(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 356
LDI r1, 148
LDI r2, 12
LDI r3, 88
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
