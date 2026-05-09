; DESCRIPTION: Renders a magenta disk with center (46, 145) and radius 39.
; PLAN: r0=46(x), r1=145(y), r2=39(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 46
LDI r1, 145
LDI r2, 39
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
