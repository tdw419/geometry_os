; DESCRIPTION: Renders a black disk with center (215, 54) and radius 49.
; PLAN: r0=215(x), r1=54(y), r2=49(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 215
LDI r1, 54
LDI r2, 49
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
