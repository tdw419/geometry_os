; DESCRIPTION: Places a black circle of radius 46 at center (344, 119).
; PLAN: r0=344(x), r1=119(y), r2=46(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 344
LDI r1, 119
LDI r2, 46
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
