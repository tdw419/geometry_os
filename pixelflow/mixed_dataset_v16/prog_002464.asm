; DESCRIPTION: Places a white disk with center (9, 161) and radius 54.
; PLAN: r0=9(x), r1=161(y), r2=54(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 9
LDI r1, 161
LDI r2, 54
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
