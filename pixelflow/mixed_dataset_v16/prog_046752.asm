; DESCRIPTION: Places a orange disk with center (98, 107) and radius 69.
; PLAN: r0=98(x), r1=107(y), r2=69(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 98
LDI r1, 107
LDI r2, 69
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
