; DESCRIPTION: Places 4 red circles at the corners of the screen.
; PLAN: r0=34(x1), r1=24(y), r2=41(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 34
LDI r1, 24
LDI r2, 41
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
