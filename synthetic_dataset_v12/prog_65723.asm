; DESCRIPTION: Renders a magenta disk with center (84, 72) and radius 50.
; PLAN: r0=84(x), r1=72(y), r2=50(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 84
LDI r1, 72
LDI r2, 50
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
