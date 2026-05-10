; DESCRIPTION: Places a green circle of radius 39 at center (455, 52).
; PLAN: r0=455(x), r1=52(y), r2=39(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 455
LDI r1, 52
LDI r2, 39
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
