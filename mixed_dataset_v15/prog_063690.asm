; DESCRIPTION: Renders a blue disk with center (85, 209) and radius 39.
; PLAN: r0=85(x), r1=209(y), r2=39(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 85
LDI r1, 209
LDI r2, 39
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
