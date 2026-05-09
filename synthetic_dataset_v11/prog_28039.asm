; DESCRIPTION: Renders a magenta disk with center (82, 193) and radius 29.
; PLAN: r0=82(x), r1=193(y), r2=29(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 82
LDI r1, 193
LDI r2, 29
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
