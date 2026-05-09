; DESCRIPTION: Renders a red disk with center (168, 116) and radius 80.
; PLAN: r0=168(x), r1=116(y), r2=80(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 168
LDI r1, 116
LDI r2, 80
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
