; DESCRIPTION: Renders a purple disk with center (433, 171) and radius 61.
; PLAN: r0=433(x), r1=171(y), r2=61(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 433
LDI r1, 171
LDI r2, 61
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
