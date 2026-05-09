; DESCRIPTION: Renders a green disk with center (185, 197) and radius 56.
; PLAN: r0=185(x), r1=197(y), r2=56(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 185
LDI r1, 197
LDI r2, 56
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
