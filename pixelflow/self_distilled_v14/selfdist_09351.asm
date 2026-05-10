; DESCRIPTION: Renders a magenta circular shape at (355, 20) with radius 10.
; PLAN: r0=355(x), r1=20(y), r2=10(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 355
LDI r1, 20
LDI r2, 10
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
