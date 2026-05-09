; DESCRIPTION: Places a green circle of radius 41 at center (174, 45).
; PLAN: r0=174(x), r1=45(y), r2=41(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 174
LDI r1, 45
LDI r2, 41
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
