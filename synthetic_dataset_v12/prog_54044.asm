; DESCRIPTION: Renders a red disk with center (353, 97) and radius 76.
; PLAN: r0=353(x), r1=97(y), r2=76(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 353
LDI r1, 97
LDI r2, 76
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
