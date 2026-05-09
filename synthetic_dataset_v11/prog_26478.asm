; DESCRIPTION: Renders a red disk with center (210, 122) and radius 39.
; PLAN: r0=210(x), r1=122(y), r2=39(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 210
LDI r1, 122
LDI r2, 39
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
