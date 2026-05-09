; DESCRIPTION: Renders a green disk with center (377, 202) and radius 46.
; PLAN: r0=377(x), r1=202(y), r2=46(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 377
LDI r1, 202
LDI r2, 46
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
