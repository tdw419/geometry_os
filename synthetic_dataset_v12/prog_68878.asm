; DESCRIPTION: Places a red circle of radius 39 at center (325, 152).
; PLAN: r0=325(x), r1=152(y), r2=39(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 325
LDI r1, 152
LDI r2, 39
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
