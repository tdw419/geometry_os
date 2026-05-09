; DESCRIPTION: Renders a magenta disk with center (161, 164) and radius 49.
; PLAN: r0=161(x), r1=164(y), r2=49(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 161
LDI r1, 164
LDI r2, 49
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
