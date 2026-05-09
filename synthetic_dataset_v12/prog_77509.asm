; DESCRIPTION: Places a blue circle of radius 30 at center (167, 191).
; PLAN: r0=167(x), r1=191(y), r2=30(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 167
LDI r1, 191
LDI r2, 30
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
