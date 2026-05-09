; DESCRIPTION: Places a yellow circle of radius 41 at center (69, 210).
; PLAN: r0=69(x), r1=210(y), r2=41(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 69
LDI r1, 210
LDI r2, 41
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
