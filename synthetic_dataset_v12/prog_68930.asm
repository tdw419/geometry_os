; DESCRIPTION: Places a magenta circle of radius 25 at center (453, 48).
; PLAN: r0=453(x), r1=48(y), r2=25(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 453
LDI r1, 48
LDI r2, 25
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
