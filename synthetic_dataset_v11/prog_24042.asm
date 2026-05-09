; DESCRIPTION: Renders a magenta disk with center (124, 68) and radius 31.
; PLAN: r0=124(x), r1=68(y), r2=31(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 124
LDI r1, 68
LDI r2, 31
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
