; DESCRIPTION: Places a red circle of radius 49 at center (243, 110).
; PLAN: r0=243(x), r1=110(y), r2=49(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 243
LDI r1, 110
LDI r2, 49
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
