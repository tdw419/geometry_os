; DESCRIPTION: Renders a magenta disk with center (214, 108) and radius 36.
; PLAN: r0=214(x), r1=108(y), r2=36(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 214
LDI r1, 108
LDI r2, 36
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
