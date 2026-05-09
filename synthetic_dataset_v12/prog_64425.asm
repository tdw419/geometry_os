; DESCRIPTION: Renders a magenta box of size 50x94 starting at (288, 88).
; PLAN: r0=288(x), r1=88(y), r2=50(width), r3=94(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 288
LDI r1, 88
LDI r2, 50
LDI r3, 94
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
