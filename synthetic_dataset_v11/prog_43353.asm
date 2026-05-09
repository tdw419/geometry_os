; DESCRIPTION: Renders a yellow disk with center (127, 101) and radius 79.
; PLAN: r0=127(x), r1=101(y), r2=79(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 127
LDI r1, 101
LDI r2, 79
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
