; DESCRIPTION: Renders a green disk with center (396, 204) and radius 39.
; PLAN: r0=396(x), r1=204(y), r2=39(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 396
LDI r1, 204
LDI r2, 39
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
