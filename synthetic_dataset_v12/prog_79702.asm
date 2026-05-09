; DESCRIPTION: Renders a magenta disk with center (393, 154) and radius 30.
; PLAN: r0=393(x), r1=154(y), r2=30(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 393
LDI r1, 154
LDI r2, 30
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
