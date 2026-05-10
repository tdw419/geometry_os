; DESCRIPTION: Places a yellow disk with center (380, 69) and radius 31.
; PLAN: r0=380(x), r1=69(y), r2=31(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 380
LDI r1, 69
LDI r2, 31
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
