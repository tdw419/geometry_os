; DESCRIPTION: Renders a yellow disk with center (113, 149) and radius 80.
; PLAN: r0=113(x), r1=149(y), r2=80(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 113
LDI r1, 149
LDI r2, 80
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
