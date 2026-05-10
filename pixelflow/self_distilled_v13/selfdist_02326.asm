; DESCRIPTION: Renders a purple circular shape at (80, 127) with radius 48.
; PLAN: r0=80(x), r1=127(y), r2=48(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 80
LDI r1, 127
LDI r2, 48
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
