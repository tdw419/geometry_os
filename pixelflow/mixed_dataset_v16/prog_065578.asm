; DESCRIPTION: Renders a magenta disk with center (76, 164) and radius 39.
; PLAN: r0=76(x), r1=164(y), r2=39(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 76
LDI r1, 164
LDI r2, 39
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
