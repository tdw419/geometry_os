; DESCRIPTION: Renders a magenta disk with center (380, 116) and radius 38.
; PLAN: r0=380(x), r1=116(y), r2=38(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 380
LDI r1, 116
LDI r2, 38
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
