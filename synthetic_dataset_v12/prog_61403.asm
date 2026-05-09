; DESCRIPTION: Renders a magenta disk with center (166, 136) and radius 42.
; PLAN: r0=166(x), r1=136(y), r2=42(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 166
LDI r1, 136
LDI r2, 42
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
