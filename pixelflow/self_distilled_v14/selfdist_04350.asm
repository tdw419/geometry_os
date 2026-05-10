; DESCRIPTION: Renders a magenta circular shape at (237, 52) with radius 36.
; PLAN: r0=237(x), r1=52(y), r2=36(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 237
LDI r1, 52
LDI r2, 36
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
