; DESCRIPTION: Places a yellow disk with center (398, 29) and radius 69.
; PLAN: r0=398(x), r1=29(y), r2=69(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 398
LDI r1, 29
LDI r2, 69
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
