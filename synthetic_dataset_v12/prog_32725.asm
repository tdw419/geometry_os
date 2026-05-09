; DESCRIPTION: Renders a red disk with center (301, 66) and radius 24.
; PLAN: r0=301(x), r1=66(y), r2=24(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 301
LDI r1, 66
LDI r2, 24
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
