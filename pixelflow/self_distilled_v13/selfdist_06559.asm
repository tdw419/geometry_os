; DESCRIPTION: Places a orange disk with center (264, 69) and radius 20.
; PLAN: r0=264(x), r1=69(y), r2=20(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 264
LDI r1, 69
LDI r2, 20
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
