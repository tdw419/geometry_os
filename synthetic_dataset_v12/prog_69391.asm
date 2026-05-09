; DESCRIPTION: Renders a purple disk with center (218, 226) and radius 25.
; PLAN: r0=218(x), r1=226(y), r2=25(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 218
LDI r1, 226
LDI r2, 25
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
