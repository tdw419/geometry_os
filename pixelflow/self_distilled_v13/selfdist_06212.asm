; DESCRIPTION: Places a orange disk with center (350, 66) and radius 28.
; PLAN: r0=350(x), r1=66(y), r2=28(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 350
LDI r1, 66
LDI r2, 28
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
