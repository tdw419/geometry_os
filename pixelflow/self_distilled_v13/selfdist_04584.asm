; DESCRIPTION: Places a blue disk with center (203, 19) and radius 27.
; PLAN: r0=203(x), r1=19(y), r2=27(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 203
LDI r1, 19
LDI r2, 27
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
