; DESCRIPTION: Places a white disk with center (33, 9) and radius 68.
; PLAN: r0=33(x), r1=9(y), r2=68(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 33
LDI r1, 9
LDI r2, 68
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
