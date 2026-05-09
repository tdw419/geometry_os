; DESCRIPTION: Renders a green disk with center (94, 79) and radius 43.
; PLAN: r0=94(x), r1=79(y), r2=43(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 94
LDI r1, 79
LDI r2, 43
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
