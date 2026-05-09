; DESCRIPTION: Renders a purple disk with center (210, 187) and radius 46.
; PLAN: r0=210(x), r1=187(y), r2=46(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 210
LDI r1, 187
LDI r2, 46
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
