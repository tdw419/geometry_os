; DESCRIPTION: Renders a green disk with center (93, 108) and radius 59.
; PLAN: r0=93(x), r1=108(y), r2=59(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 93
LDI r1, 108
LDI r2, 59
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
