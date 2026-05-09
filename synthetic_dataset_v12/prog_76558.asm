; DESCRIPTION: Renders a magenta disk with center (337, 167) and radius 50.
; PLAN: r0=337(x), r1=167(y), r2=50(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 337
LDI r1, 167
LDI r2, 50
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
