; DESCRIPTION: Renders a magenta disk with center (209, 176) and radius 80.
; PLAN: r0=209(x), r1=176(y), r2=80(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 209
LDI r1, 176
LDI r2, 80
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
