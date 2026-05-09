; DESCRIPTION: Renders a purple disk with center (209, 212) and radius 19.
; PLAN: r0=209(x), r1=212(y), r2=19(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 209
LDI r1, 212
LDI r2, 19
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
