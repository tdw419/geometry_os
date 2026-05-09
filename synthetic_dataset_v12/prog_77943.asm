; DESCRIPTION: Renders a yellow disk with center (80, 187) and radius 46.
; PLAN: r0=80(x), r1=187(y), r2=46(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 80
LDI r1, 187
LDI r2, 46
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
