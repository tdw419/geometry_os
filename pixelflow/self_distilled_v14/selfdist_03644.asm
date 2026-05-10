; DESCRIPTION: Places 4 green circles at the corners of the screen.
; PLAN: r0=24(x1), r1=24(y), r2=41(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 24
LDI r1, 24
LDI r2, 41
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
