; DESCRIPTION: Renders a magenta circular shape at (61, 12) with radius 44.
; PLAN: r0=61(x), r1=12(y), r2=44(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 61
LDI r1, 12
LDI r2, 44
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
