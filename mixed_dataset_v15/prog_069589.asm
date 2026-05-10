; DESCRIPTION: Places a red circle of radius 65 at center (372, 119).
; PLAN: r0=372(x), r1=119(y), r2=65(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 372
LDI r1, 119
LDI r2, 65
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
