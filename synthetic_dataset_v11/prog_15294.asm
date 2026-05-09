; DESCRIPTION: Renders a red disk with center (176, 93) and radius 75.
; PLAN: r0=176(x), r1=93(y), r2=75(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 176
LDI r1, 93
LDI r2, 75
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
