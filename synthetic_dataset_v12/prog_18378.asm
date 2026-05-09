; DESCRIPTION: Places a yellow circle of radius 41 at center (268, 133).
; PLAN: r0=268(x), r1=133(y), r2=41(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 268
LDI r1, 133
LDI r2, 41
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
