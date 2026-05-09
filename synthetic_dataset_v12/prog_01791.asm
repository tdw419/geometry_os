; DESCRIPTION: Renders a magenta disk with center (103, 133) and radius 39.
; PLAN: r0=103(x), r1=133(y), r2=39(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 103
LDI r1, 133
LDI r2, 39
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
