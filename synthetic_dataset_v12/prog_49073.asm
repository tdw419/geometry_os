; DESCRIPTION: Renders a green disk with center (272, 150) and radius 17.
; PLAN: r0=272(x), r1=150(y), r2=17(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 272
LDI r1, 150
LDI r2, 17
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
