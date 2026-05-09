; DESCRIPTION: Renders a green disk with center (361, 72) and radius 22.
; PLAN: r0=361(x), r1=72(y), r2=22(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 361
LDI r1, 72
LDI r2, 22
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
