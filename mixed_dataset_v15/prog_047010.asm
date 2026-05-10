; DESCRIPTION: Renders a magenta disk with center (402, 164) and radius 55.
; PLAN: r0=402(x), r1=164(y), r2=55(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 402
LDI r1, 164
LDI r2, 55
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
