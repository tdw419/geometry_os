; DESCRIPTION: Renders a green disk with center (59, 118) and radius 36.
; PLAN: r0=59(x), r1=118(y), r2=36(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 59
LDI r1, 118
LDI r2, 36
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
