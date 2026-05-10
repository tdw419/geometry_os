; DESCRIPTION: Renders a red disk with center (117, 62) and radius 48.
; PLAN: r0=117(x), r1=62(y), r2=48(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 117
LDI r1, 62
LDI r2, 48
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
