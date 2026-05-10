; DESCRIPTION: Renders a magenta circular shape at (378, 152) with radius 48.
; PLAN: r0=378(x), r1=152(y), r2=48(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 378
LDI r1, 152
LDI r2, 48
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
