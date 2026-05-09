; DESCRIPTION: Renders a green disk with center (366, 117) and radius 61.
; PLAN: r0=366(x), r1=117(y), r2=61(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 366
LDI r1, 117
LDI r2, 61
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
