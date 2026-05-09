; DESCRIPTION: Renders a magenta disk with center (350, 111) and radius 73.
; PLAN: r0=350(x), r1=111(y), r2=73(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 350
LDI r1, 111
LDI r2, 73
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
