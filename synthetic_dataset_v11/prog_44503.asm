; DESCRIPTION: Renders a red disk with center (140, 195) and radius 21.
; PLAN: r0=140(x), r1=195(y), r2=21(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 140
LDI r1, 195
LDI r2, 21
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
