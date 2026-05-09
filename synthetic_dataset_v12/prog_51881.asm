; DESCRIPTION: Places a red circle of radius 20 at center (372, 44).
; PLAN: r0=372(x), r1=44(y), r2=20(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 372
LDI r1, 44
LDI r2, 20
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
