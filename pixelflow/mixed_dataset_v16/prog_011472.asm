; DESCRIPTION: Places a purple disk with center (344, 104) and radius 39.
; PLAN: r0=344(x), r1=104(y), r2=39(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 344
LDI r1, 104
LDI r2, 39
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
