; DESCRIPTION: Renders a magenta circular shape at (36, 8) with radius 26.
; PLAN: r0=36(x), r1=8(y), r2=26(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 36
LDI r1, 8
LDI r2, 26
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
