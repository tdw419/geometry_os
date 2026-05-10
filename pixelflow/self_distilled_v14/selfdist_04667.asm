; DESCRIPTION: Places a blue disk with center (346, 176) and radius 66.
; PLAN: r0=346(x), r1=176(y), r2=66(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 346
LDI r1, 176
LDI r2, 66
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
