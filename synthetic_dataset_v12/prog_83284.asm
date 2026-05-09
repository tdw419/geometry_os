; DESCRIPTION: Renders a magenta disk with center (236, 176) and radius 60.
; PLAN: r0=236(x), r1=176(y), r2=60(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 236
LDI r1, 176
LDI r2, 60
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
