; DESCRIPTION: Places a blue circle of radius 32 at center (44, 161).
; PLAN: r0=44(x), r1=161(y), r2=32(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 44
LDI r1, 161
LDI r2, 32
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
