; DESCRIPTION: Places a green disk with center (186, 139) and radius 30.
; PLAN: r0=186(x), r1=139(y), r2=30(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 186
LDI r1, 139
LDI r2, 30
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
