; DESCRIPTION: Renders a magenta disk with center (331, 126) and radius 69.
; PLAN: r0=331(x), r1=126(y), r2=69(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 331
LDI r1, 126
LDI r2, 69
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
