; DESCRIPTION: Renders a yellow disk with center (106, 143) and radius 39.
; PLAN: r0=106(x), r1=143(y), r2=39(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 106
LDI r1, 143
LDI r2, 39
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
