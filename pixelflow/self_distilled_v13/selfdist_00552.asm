; DESCRIPTION: Places a green disk with center (370, 65) and radius 43.
; PLAN: r0=370(x), r1=65(y), r2=43(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 370
LDI r1, 65
LDI r2, 43
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
