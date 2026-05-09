; DESCRIPTION: Places a green circle of radius 74 at center (104, 162).
; PLAN: r0=104(x), r1=162(y), r2=74(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 104
LDI r1, 162
LDI r2, 74
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
