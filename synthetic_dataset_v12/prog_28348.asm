; DESCRIPTION: Places a green circle of radius 77 at center (286, 88).
; PLAN: r0=286(x), r1=88(y), r2=77(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 286
LDI r1, 88
LDI r2, 77
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
