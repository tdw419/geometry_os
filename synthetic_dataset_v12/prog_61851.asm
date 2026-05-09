; DESCRIPTION: Places a green circle of radius 14 at center (178, 52).
; PLAN: r0=178(x), r1=52(y), r2=14(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 178
LDI r1, 52
LDI r2, 14
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
