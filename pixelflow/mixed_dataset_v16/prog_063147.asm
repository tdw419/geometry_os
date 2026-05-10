; DESCRIPTION: Renders a magenta disk with center (84, 127) and radius 58.
; PLAN: r0=84(x), r1=127(y), r2=58(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 84
LDI r1, 127
LDI r2, 58
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
