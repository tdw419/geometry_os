; DESCRIPTION: Places a red circle of radius 39 at center (459, 130).
; PLAN: r0=459(x), r1=130(y), r2=39(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 459
LDI r1, 130
LDI r2, 39
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
