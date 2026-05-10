; DESCRIPTION: Places a green disk with center (95, 52) and radius 21.
; PLAN: r0=95(x), r1=52(y), r2=21(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 95
LDI r1, 52
LDI r2, 21
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
