; DESCRIPTION: Renders a purple disk with center (60, 190) and radius 53.
; PLAN: r0=60(x), r1=190(y), r2=53(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 60
LDI r1, 190
LDI r2, 53
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
