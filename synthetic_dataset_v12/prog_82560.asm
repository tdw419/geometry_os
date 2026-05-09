; DESCRIPTION: Renders a purple disk with center (374, 171) and radius 57.
; PLAN: r0=374(x), r1=171(y), r2=57(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 374
LDI r1, 171
LDI r2, 57
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
