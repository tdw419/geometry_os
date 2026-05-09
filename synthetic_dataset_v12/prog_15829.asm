; DESCRIPTION: Places a red circle of radius 15 at center (475, 224).
; PLAN: r0=475(x), r1=224(y), r2=15(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 475
LDI r1, 224
LDI r2, 15
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
