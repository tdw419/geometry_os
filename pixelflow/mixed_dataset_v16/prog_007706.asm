; DESCRIPTION: Renders a magenta disk with center (210, 82) and radius 74.
; PLAN: r0=210(x), r1=82(y), r2=74(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 210
LDI r1, 82
LDI r2, 74
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
