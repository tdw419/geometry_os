; DESCRIPTION: Renders a red disk with center (262, 60) and radius 47.
; PLAN: r0=262(x), r1=60(y), r2=47(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 262
LDI r1, 60
LDI r2, 47
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
