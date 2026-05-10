; DESCRIPTION: Places a white disk with center (126, 25) and radius 36.
; PLAN: r0=126(x), r1=25(y), r2=36(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 126
LDI r1, 25
LDI r2, 36
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
