; DESCRIPTION: Renders a yellow disk with center (113, 133) and radius 33.
; PLAN: r0=113(x), r1=133(y), r2=33(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 113
LDI r1, 133
LDI r2, 33
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
