; DESCRIPTION: Renders a magenta rectangular region spanning 88 by 36 at (45, 39).
; PLAN: r0=45(x), r1=39(y), r2=88(width), r3=36(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 45
LDI r1, 39
LDI r2, 88
LDI r3, 36
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
