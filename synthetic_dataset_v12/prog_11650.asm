; DESCRIPTION: Renders a green disk with center (357, 194) and radius 27.
; PLAN: r0=357(x), r1=194(y), r2=27(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 357
LDI r1, 194
LDI r2, 27
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
