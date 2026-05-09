; DESCRIPTION: Places a green circle of radius 25 at center (175, 212).
; PLAN: r0=175(x), r1=212(y), r2=25(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 175
LDI r1, 212
LDI r2, 25
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
