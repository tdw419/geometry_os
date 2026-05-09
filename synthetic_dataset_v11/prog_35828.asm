; DESCRIPTION: Renders a magenta disk with center (87, 65) and radius 35.
; PLAN: r0=87(x), r1=65(y), r2=35(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 87
LDI r1, 65
LDI r2, 35
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
