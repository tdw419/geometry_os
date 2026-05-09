; DESCRIPTION: Renders a green disk with center (28, 127) and radius 18.
; PLAN: r0=28(x), r1=127(y), r2=18(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 28
LDI r1, 127
LDI r2, 18
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
