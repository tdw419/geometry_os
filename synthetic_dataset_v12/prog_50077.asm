; DESCRIPTION: Places a green circle of radius 25 at center (79, 225).
; PLAN: r0=79(x), r1=225(y), r2=25(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 79
LDI r1, 225
LDI r2, 25
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
