; DESCRIPTION: Renders a yellow disk with center (317, 157) and radius 68.
; PLAN: r0=317(x), r1=157(y), r2=68(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 317
LDI r1, 157
LDI r2, 68
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
