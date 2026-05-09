; DESCRIPTION: Places a yellow circle of radius 10 at center (76, 174).
; PLAN: r0=76(x), r1=174(y), r2=10(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 76
LDI r1, 174
LDI r2, 10
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
