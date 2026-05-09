; DESCRIPTION: Renders a magenta disk with center (150, 31) and radius 19.
; PLAN: r0=150(x), r1=31(y), r2=19(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 150
LDI r1, 31
LDI r2, 19
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
