; DESCRIPTION: Renders a purple disk with center (178, 186) and radius 48.
; PLAN: r0=178(x), r1=186(y), r2=48(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 178
LDI r1, 186
LDI r2, 48
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
