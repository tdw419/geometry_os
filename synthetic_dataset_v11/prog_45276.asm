; DESCRIPTION: Renders a magenta disk with center (32, 214) and radius 18.
; PLAN: r0=32(x), r1=214(y), r2=18(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 32
LDI r1, 214
LDI r2, 18
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
