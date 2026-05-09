; DESCRIPTION: Renders a magenta disk with center (110, 150) and radius 21.
; PLAN: r0=110(x), r1=150(y), r2=21(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 110
LDI r1, 150
LDI r2, 21
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
