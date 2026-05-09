; DESCRIPTION: Places a green circle of radius 35 at center (126, 87).
; PLAN: r0=126(x), r1=87(y), r2=35(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 126
LDI r1, 87
LDI r2, 35
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
