; DESCRIPTION: Renders a red disk with center (238, 141) and radius 63.
; PLAN: r0=238(x), r1=141(y), r2=63(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 238
LDI r1, 141
LDI r2, 63
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
