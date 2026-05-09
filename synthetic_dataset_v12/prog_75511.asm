; DESCRIPTION: Places a blue circle of radius 28 at center (303, 176).
; PLAN: r0=303(x), r1=176(y), r2=28(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 303
LDI r1, 176
LDI r2, 28
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
