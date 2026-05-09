; DESCRIPTION: Renders a yellow disk with center (361, 161) and radius 58.
; PLAN: r0=361(x), r1=161(y), r2=58(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 361
LDI r1, 161
LDI r2, 58
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
