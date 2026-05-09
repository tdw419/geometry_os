; DESCRIPTION: Places a red circle of radius 18 at center (203, 149).
; PLAN: r0=203(x), r1=149(y), r2=18(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 203
LDI r1, 149
LDI r2, 18
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
