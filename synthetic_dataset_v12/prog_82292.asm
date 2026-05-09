; DESCRIPTION: Places a yellow circle of radius 35 at center (273, 221).
; PLAN: r0=273(x), r1=221(y), r2=35(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 273
LDI r1, 221
LDI r2, 35
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
