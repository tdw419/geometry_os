; DESCRIPTION: Renders a magenta disk with center (395, 68) and radius 53.
; PLAN: r0=395(x), r1=68(y), r2=53(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 395
LDI r1, 68
LDI r2, 53
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
