; DESCRIPTION: Places a white disk with center (216, 187) and radius 64.
; PLAN: r0=216(x), r1=187(y), r2=64(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 216
LDI r1, 187
LDI r2, 64
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
