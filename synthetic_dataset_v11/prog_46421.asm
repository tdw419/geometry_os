; DESCRIPTION: Renders a magenta disk with center (75, 71) and radius 59.
; PLAN: r0=75(x), r1=71(y), r2=59(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 75
LDI r1, 71
LDI r2, 59
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
