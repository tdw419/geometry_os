; DESCRIPTION: Renders a purple disk with center (177, 70) and radius 50.
; PLAN: r0=177(x), r1=70(y), r2=50(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 177
LDI r1, 70
LDI r2, 50
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
