; DESCRIPTION: Renders a magenta disk with center (401, 60) and radius 37.
; PLAN: r0=401(x), r1=60(y), r2=37(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 401
LDI r1, 60
LDI r2, 37
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
