; DESCRIPTION: Places a white disk with center (86, 12) and radius 32.
; PLAN: r0=86(x), r1=12(y), r2=32(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 86
LDI r1, 12
LDI r2, 32
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
