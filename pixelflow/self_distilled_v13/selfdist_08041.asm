; DESCRIPTION: Places 4 white circles at the corners of the screen.
; PLAN: r0=24(x1), r1=14(y), r2=41(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 24
LDI r1, 14
LDI r2, 41
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
