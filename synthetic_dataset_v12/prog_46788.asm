; DESCRIPTION: Places a green circle of radius 52 at center (275, 153).
; PLAN: r0=275(x), r1=153(y), r2=52(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 275
LDI r1, 153
LDI r2, 52
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
