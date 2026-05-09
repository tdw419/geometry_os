; DESCRIPTION: Renders a magenta disk with center (182, 219) and radius 31.
; PLAN: r0=182(x), r1=219(y), r2=31(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 182
LDI r1, 219
LDI r2, 31
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
