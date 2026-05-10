; DESCRIPTION: Renders a magenta rectangular region spanning 37 by 76 at (36, 200).
; PLAN: r0=36(x), r1=200(y), r2=37(width), r3=76(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 200
LDI r2, 37
LDI r3, 76
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
