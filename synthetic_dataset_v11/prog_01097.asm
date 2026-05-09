; DESCRIPTION: Renders a magenta disk with center (222, 85) and radius 27.
; PLAN: r0=222(x), r1=85(y), r2=27(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 222
LDI r1, 85
LDI r2, 27
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
