; DESCRIPTION: Renders a magenta disk with center (203, 124) and radius 36.
; PLAN: r0=203(x), r1=124(y), r2=36(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 203
LDI r1, 124
LDI r2, 36
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
