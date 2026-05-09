; DESCRIPTION: Renders a red disk with center (202, 140) and radius 71.
; PLAN: r0=202(x), r1=140(y), r2=71(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 202
LDI r1, 140
LDI r2, 71
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
