; DESCRIPTION: Renders a magenta disk with center (137, 82) and radius 21.
; PLAN: r0=137(x), r1=82(y), r2=21(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 137
LDI r1, 82
LDI r2, 21
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
