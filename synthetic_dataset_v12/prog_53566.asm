; DESCRIPTION: Renders a blue disk with center (75, 149) and radius 57.
; PLAN: r0=75(x), r1=149(y), r2=57(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 75
LDI r1, 149
LDI r2, 57
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
