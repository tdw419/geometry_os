; DESCRIPTION: Renders a red disk with center (134, 143) and radius 62.
; PLAN: r0=134(x), r1=143(y), r2=62(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 134
LDI r1, 143
LDI r2, 62
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
