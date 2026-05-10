; DESCRIPTION: Renders a red disk with center (236, 83) and radius 71.
; PLAN: r0=236(x), r1=83(y), r2=71(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 236
LDI r1, 83
LDI r2, 71
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
