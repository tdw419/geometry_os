; DESCRIPTION: Renders a green disk with center (469, 150) and radius 19.
; PLAN: r0=469(x), r1=150(y), r2=19(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 469
LDI r1, 150
LDI r2, 19
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
