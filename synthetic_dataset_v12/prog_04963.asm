; DESCRIPTION: Renders a blue disk with center (434, 118) and radius 75.
; PLAN: r0=434(x), r1=118(y), r2=75(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 434
LDI r1, 118
LDI r2, 75
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
