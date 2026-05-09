; DESCRIPTION: Renders a purple disk with center (279, 149) and radius 66.
; PLAN: r0=279(x), r1=149(y), r2=66(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 279
LDI r1, 149
LDI r2, 66
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
