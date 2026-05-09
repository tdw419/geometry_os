; DESCRIPTION: Creates a magenta circular shape at (74, 147) with radius 36.
; PLAN: r0=74(x), r1=147(y), r2=36(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 74
LDI r1, 147
LDI r2, 36
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
