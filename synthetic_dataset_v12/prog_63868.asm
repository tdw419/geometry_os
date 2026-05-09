; DESCRIPTION: Places a purple circle of radius 66 at center (344, 159).
; PLAN: r0=344(x), r1=159(y), r2=66(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 344
LDI r1, 159
LDI r2, 66
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
