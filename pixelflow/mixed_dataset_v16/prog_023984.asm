; DESCRIPTION: Places a green disk with center (395, 189) and radius 65.
; PLAN: r0=395(x), r1=189(y), r2=65(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 395
LDI r1, 189
LDI r2, 65
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
