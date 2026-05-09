; DESCRIPTION: Renders a green disk with center (239, 118) and radius 18.
; PLAN: r0=239(x), r1=118(y), r2=18(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 239
LDI r1, 118
LDI r2, 18
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
