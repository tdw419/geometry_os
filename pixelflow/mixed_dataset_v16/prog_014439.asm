; DESCRIPTION: Renders a purple disk with center (317, 125) and radius 50.
; PLAN: r0=317(x), r1=125(y), r2=50(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 317
LDI r1, 125
LDI r2, 50
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
