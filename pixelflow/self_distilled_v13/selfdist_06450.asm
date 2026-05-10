; DESCRIPTION: Places a green disk with center (287, 21) and radius 27.
; PLAN: r0=287(x), r1=21(y), r2=27(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 287
LDI r1, 21
LDI r2, 27
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
