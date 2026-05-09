; DESCRIPTION: Places a green circle of radius 71 at center (354, 90).
; PLAN: r0=354(x), r1=90(y), r2=71(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 354
LDI r1, 90
LDI r2, 71
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
