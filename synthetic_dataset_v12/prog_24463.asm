; DESCRIPTION: Renders a magenta disk with center (236, 177) and radius 12.
; PLAN: r0=236(x), r1=177(y), r2=12(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 236
LDI r1, 177
LDI r2, 12
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
