; DESCRIPTION: Places a white disk with center (120, 197) and radius 11.
; PLAN: r0=120(x), r1=197(y), r2=11(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 120
LDI r1, 197
LDI r2, 11
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
