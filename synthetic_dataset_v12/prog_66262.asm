; DESCRIPTION: Renders a blue disk with center (465, 207) and radius 13.
; PLAN: r0=465(x), r1=207(y), r2=13(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 465
LDI r1, 207
LDI r2, 13
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
