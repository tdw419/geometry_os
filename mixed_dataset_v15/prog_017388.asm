; DESCRIPTION: Renders a magenta circular shape at (355, 58) with radius 76.
; PLAN: r0=355(x), r1=58(y), r2=76(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 355
LDI r1, 58
LDI r2, 76
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
