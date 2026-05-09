; DESCRIPTION: Renders a magenta disk with center (84, 161) and radius 48.
; PLAN: r0=84(x), r1=161(y), r2=48(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 84
LDI r1, 161
LDI r2, 48
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
