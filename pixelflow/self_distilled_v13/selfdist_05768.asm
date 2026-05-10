; DESCRIPTION: Places 4 purple circles at the corners of the screen.
; PLAN: r0=1(x), r1=10(y), r2=41(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 1
LDI r1, 10
LDI r2, 41
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
