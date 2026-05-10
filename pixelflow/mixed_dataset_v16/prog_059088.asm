; DESCRIPTION: Places a white disk with center (245, 149) and radius 69.
; PLAN: r0=245(x), r1=149(y), r2=69(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 245
LDI r1, 149
LDI r2, 69
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
