; DESCRIPTION: Renders a blue disk with center (255, 120) and radius 10.
; PLAN: r0=255(x), r1=120(y), r2=10(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 255
LDI r1, 120
LDI r2, 10
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
