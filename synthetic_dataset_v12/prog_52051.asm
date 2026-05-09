; DESCRIPTION: Renders a blue disk with center (60, 236) and radius 10.
; PLAN: r0=60(x), r1=236(y), r2=10(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 60
LDI r1, 236
LDI r2, 10
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
