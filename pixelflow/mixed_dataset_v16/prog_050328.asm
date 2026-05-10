; DESCRIPTION: Renders a magenta rectangular region spanning 118 by 88 at (83, 107).
; PLAN: r0=83(x), r1=107(y), r2=118(width), r3=88(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 83
LDI r1, 107
LDI r2, 118
LDI r3, 88
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
