; DESCRIPTION: Renders a magenta disk with center (464, 200) and radius 46.
; PLAN: r0=464(x), r1=200(y), r2=46(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 464
LDI r1, 200
LDI r2, 46
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
