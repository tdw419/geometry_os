; DESCRIPTION: Renders a blue disk with center (262, 93) and radius 78.
; PLAN: r0=262(x), r1=93(y), r2=78(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 262
LDI r1, 93
LDI r2, 78
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
