; DESCRIPTION: Renders a magenta disk with center (415, 102) and radius 63.
; PLAN: r0=415(x), r1=102(y), r2=63(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 415
LDI r1, 102
LDI r2, 63
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
