; DESCRIPTION: Renders a magenta disk with center (160, 162) and radius 71.
; PLAN: r0=160(x), r1=162(y), r2=71(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 160
LDI r1, 162
LDI r2, 71
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
