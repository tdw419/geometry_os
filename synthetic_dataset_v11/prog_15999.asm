; DESCRIPTION: Renders a green disk with center (90, 97) and radius 70.
; PLAN: r0=90(x), r1=97(y), r2=70(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 90
LDI r1, 97
LDI r2, 70
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
