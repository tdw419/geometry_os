; DESCRIPTION: Renders a purple disk with center (275, 149) and radius 71.
; PLAN: r0=275(x), r1=149(y), r2=71(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 275
LDI r1, 149
LDI r2, 71
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
