; DESCRIPTION: Renders a magenta disk with center (432, 104) and radius 64.
; PLAN: r0=432(x), r1=104(y), r2=64(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 432
LDI r1, 104
LDI r2, 64
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
