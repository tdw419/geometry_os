; DESCRIPTION: Places 4 magenta circles at the corners of the screen.
; PLAN: r0=24(x), r1=41(y), r2=41(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 24
LDI r1, 41
LDI r2, 41
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
