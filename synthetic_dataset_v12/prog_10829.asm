; DESCRIPTION: Places a green circle of radius 37 at center (465, 98).
; PLAN: r0=465(x), r1=98(y), r2=37(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 465
LDI r1, 98
LDI r2, 37
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
