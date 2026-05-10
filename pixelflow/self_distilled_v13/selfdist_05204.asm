; DESCRIPTION: Renders a magenta rectangular region spanning 81 by 23 at (274, 109).
; PLAN: r0=274(x), r1=109(y), r2=81(width), r3=23(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 274
LDI r1, 109
LDI r2, 81
LDI r3, 23
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
