; DESCRIPTION: Places a green disk with center (237, 140) and radius 12.
; PLAN: r0=237(x), r1=140(y), r2=12(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 237
LDI r1, 140
LDI r2, 12
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
