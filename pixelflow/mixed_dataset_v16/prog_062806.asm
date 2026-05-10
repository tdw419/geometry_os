; DESCRIPTION: Renders a purple disk with center (44, 213) and radius 19.
; PLAN: r0=44(x), r1=213(y), r2=19(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 44
LDI r1, 213
LDI r2, 19
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
