; DESCRIPTION: Renders a red disk with center (435, 168) and radius 73.
; PLAN: r0=435(x), r1=168(y), r2=73(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 435
LDI r1, 168
LDI r2, 73
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
