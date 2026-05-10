; DESCRIPTION: Places 4 orange circles at the corners of the screen.
; PLAN: r0=27(x), r1=4(y), r2=41(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 27
LDI r1, 4
LDI r2, 41
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
