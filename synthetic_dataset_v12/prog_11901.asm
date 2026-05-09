; DESCRIPTION: Places a yellow circle of radius 76 at center (261, 174).
; PLAN: r0=261(x), r1=174(y), r2=76(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 261
LDI r1, 174
LDI r2, 76
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
