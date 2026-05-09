; DESCRIPTION: Renders a blue disk with center (193, 38) and radius 13.
; PLAN: r0=193(x), r1=38(y), r2=13(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 193
LDI r1, 38
LDI r2, 13
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
