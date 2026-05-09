; DESCRIPTION: Renders a magenta disk with center (425, 171) and radius 55.
; PLAN: r0=425(x), r1=171(y), r2=55(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 425
LDI r1, 171
LDI r2, 55
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
