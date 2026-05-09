; DESCRIPTION: Renders a magenta disk with center (406, 171) and radius 60.
; PLAN: r0=406(x), r1=171(y), r2=60(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 406
LDI r1, 171
LDI r2, 60
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
