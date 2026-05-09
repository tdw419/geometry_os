; DESCRIPTION: Places a green circle of radius 77 at center (381, 121).
; PLAN: r0=381(x), r1=121(y), r2=77(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 381
LDI r1, 121
LDI r2, 77
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
