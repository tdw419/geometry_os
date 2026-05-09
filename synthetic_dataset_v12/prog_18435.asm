; DESCRIPTION: Renders a blue disk with center (354, 135) and radius 57.
; PLAN: r0=354(x), r1=135(y), r2=57(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 354
LDI r1, 135
LDI r2, 57
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
