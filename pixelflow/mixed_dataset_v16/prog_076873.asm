; DESCRIPTION: Places a red circle of radius 30 at center (264, 56).
; PLAN: r0=264(x), r1=56(y), r2=30(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 264
LDI r1, 56
LDI r2, 30
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
