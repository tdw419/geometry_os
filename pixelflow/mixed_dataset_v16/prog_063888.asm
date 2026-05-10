; DESCRIPTION: Places a green disk with center (269, 20) and radius 12.
; PLAN: r0=269(x), r1=20(y), r2=12(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 269
LDI r1, 20
LDI r2, 12
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
