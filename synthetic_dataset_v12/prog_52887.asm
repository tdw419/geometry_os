; DESCRIPTION: Places a green circle of radius 20 at center (354, 55).
; PLAN: r0=354(x), r1=55(y), r2=20(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 354
LDI r1, 55
LDI r2, 20
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
