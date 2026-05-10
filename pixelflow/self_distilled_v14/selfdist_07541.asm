; DESCRIPTION: Places a green disk with center (48, 4) and radius 68.
; PLAN: r0=48(x), r1=4(y), r2=68(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 48
LDI r1, 4
LDI r2, 68
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
