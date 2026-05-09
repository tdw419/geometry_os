; DESCRIPTION: Renders a magenta disk with center (172, 214) and radius 35.
; PLAN: r0=172(x), r1=214(y), r2=35(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 172
LDI r1, 214
LDI r2, 35
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
