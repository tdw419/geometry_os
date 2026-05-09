; DESCRIPTION: Places a red circle of radius 28 at center (482, 105).
; PLAN: r0=482(x), r1=105(y), r2=28(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 482
LDI r1, 105
LDI r2, 28
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
