; DESCRIPTION: Renders a magenta box of size 63x49 starting at (45, 88).
; PLAN: r0=45(x), r1=88(y), r2=63(width), r3=49(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 45
LDI r1, 88
LDI r2, 63
LDI r3, 49
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
