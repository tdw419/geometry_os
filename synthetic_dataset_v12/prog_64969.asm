; DESCRIPTION: Renders a yellow disk with center (256, 104) and radius 47.
; PLAN: r0=256(x), r1=104(y), r2=47(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 256
LDI r1, 104
LDI r2, 47
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
