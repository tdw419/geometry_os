; DESCRIPTION: Renders a magenta circular shape at (325, 177) with radius 55.
; PLAN: r0=325(x), r1=177(y), r2=55(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 325
LDI r1, 177
LDI r2, 55
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
