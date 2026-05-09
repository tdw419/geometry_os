; DESCRIPTION: Renders a yellow disk with center (197, 133) and radius 31.
; PLAN: r0=197(x), r1=133(y), r2=31(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 197
LDI r1, 133
LDI r2, 31
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
