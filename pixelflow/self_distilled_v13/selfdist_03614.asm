; DESCRIPTION: Places a green disk with center (190, 3) and radius 38.
; PLAN: r0=190(x), r1=3(y), r2=38(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 190
LDI r1, 3
LDI r2, 38
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
