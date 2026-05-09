; DESCRIPTION: Renders a green disk with center (145, 91) and radius 72.
; PLAN: r0=145(x), r1=91(y), r2=72(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 145
LDI r1, 91
LDI r2, 72
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
