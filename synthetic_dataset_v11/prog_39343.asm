; DESCRIPTION: Renders a green disk with center (151, 127) and radius 78.
; PLAN: r0=151(x), r1=127(y), r2=78(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 151
LDI r1, 127
LDI r2, 78
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
