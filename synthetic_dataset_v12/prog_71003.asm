; DESCRIPTION: Places a blue circle of radius 26 at center (102, 176).
; PLAN: r0=102(x), r1=176(y), r2=26(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 102
LDI r1, 176
LDI r2, 26
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
