; DESCRIPTION: Renders a green disk with center (361, 155) and radius 68.
; PLAN: r0=361(x), r1=155(y), r2=68(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 361
LDI r1, 155
LDI r2, 68
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
