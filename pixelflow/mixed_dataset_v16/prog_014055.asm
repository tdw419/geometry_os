; DESCRIPTION: Renders a red disk with center (231, 125) and radius 71.
; PLAN: r0=231(x), r1=125(y), r2=71(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 231
LDI r1, 125
LDI r2, 71
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
