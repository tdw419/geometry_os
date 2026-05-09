; DESCRIPTION: Renders a purple disk with center (117, 127) and radius 55.
; PLAN: r0=117(x), r1=127(y), r2=55(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 117
LDI r1, 127
LDI r2, 55
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
