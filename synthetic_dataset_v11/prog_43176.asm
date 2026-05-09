; DESCRIPTION: Renders a blue disk with center (193, 29) and radius 29.
; PLAN: r0=193(x), r1=29(y), r2=29(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 193
LDI r1, 29
LDI r2, 29
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
