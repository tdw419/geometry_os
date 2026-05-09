; DESCRIPTION: Renders a magenta disk with center (170, 55) and radius 50.
; PLAN: r0=170(x), r1=55(y), r2=50(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 170
LDI r1, 55
LDI r2, 50
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
