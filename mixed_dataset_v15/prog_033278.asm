; DESCRIPTION: Places a yellow disk with center (344, 54) and radius 39.
; PLAN: r0=344(x), r1=54(y), r2=39(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 344
LDI r1, 54
LDI r2, 39
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
