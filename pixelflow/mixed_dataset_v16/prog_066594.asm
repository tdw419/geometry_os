; DESCRIPTION: Renders a magenta disk with center (406, 82) and radius 22.
; PLAN: r0=406(x), r1=82(y), r2=22(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 406
LDI r1, 82
LDI r2, 22
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
