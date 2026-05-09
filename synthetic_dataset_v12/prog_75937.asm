; DESCRIPTION: Renders a green disk with center (84, 187) and radius 66.
; PLAN: r0=84(x), r1=187(y), r2=66(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 84
LDI r1, 187
LDI r2, 66
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
