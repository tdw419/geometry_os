; DESCRIPTION: Places a blue circle of radius 59 at center (303, 142).
; PLAN: r0=303(x), r1=142(y), r2=59(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 303
LDI r1, 142
LDI r2, 59
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
