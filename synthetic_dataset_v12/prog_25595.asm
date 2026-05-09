; DESCRIPTION: Renders a blue disk with center (370, 135) and radius 49.
; PLAN: r0=370(x), r1=135(y), r2=49(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 370
LDI r1, 135
LDI r2, 49
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
