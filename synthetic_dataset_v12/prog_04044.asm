; DESCRIPTION: Renders a yellow disk with center (413, 194) and radius 39.
; PLAN: r0=413(x), r1=194(y), r2=39(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 413
LDI r1, 194
LDI r2, 39
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
