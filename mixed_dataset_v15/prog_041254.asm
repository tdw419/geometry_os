; DESCRIPTION: Places a white disk with center (236, 0) and radius 24.
; PLAN: r0=236(x), r1=0(y), r2=24(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 236
LDI r1, 0
LDI r2, 24
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
