; DESCRIPTION: Renders a red disk with center (107, 120) and radius 76.
; PLAN: r0=107(x), r1=120(y), r2=76(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 107
LDI r1, 120
LDI r2, 76
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
