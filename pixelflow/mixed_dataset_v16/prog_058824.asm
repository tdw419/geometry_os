; DESCRIPTION: Renders a magenta circular shape at (335, 73) with radius 56.
; PLAN: r0=335(x), r1=73(y), r2=56(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 335
LDI r1, 73
LDI r2, 56
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
