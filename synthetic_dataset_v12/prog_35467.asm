; DESCRIPTION: Renders a yellow disk with center (63, 72) and radius 21.
; PLAN: r0=63(x), r1=72(y), r2=21(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 63
LDI r1, 72
LDI r2, 21
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
