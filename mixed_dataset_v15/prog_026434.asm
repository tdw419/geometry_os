; DESCRIPTION: Renders a magenta disk with center (69, 68) and radius 63.
; PLAN: r0=69(x), r1=68(y), r2=63(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 69
LDI r1, 68
LDI r2, 63
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
