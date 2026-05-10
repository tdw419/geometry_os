; DESCRIPTION: Renders a magenta disk with center (372, 102) and radius 65.
; PLAN: r0=372(x), r1=102(y), r2=65(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 372
LDI r1, 102
LDI r2, 65
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
