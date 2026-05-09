; DESCRIPTION: Renders a magenta disk with center (347, 162) and radius 32.
; PLAN: r0=347(x), r1=162(y), r2=32(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 347
LDI r1, 162
LDI r2, 32
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
