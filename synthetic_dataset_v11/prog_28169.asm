; DESCRIPTION: Renders a purple disk with center (151, 197) and radius 20.
; PLAN: r0=151(x), r1=197(y), r2=20(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 151
LDI r1, 197
LDI r2, 20
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
