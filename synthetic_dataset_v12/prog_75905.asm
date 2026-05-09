; DESCRIPTION: Creates a orange circular shape at (127, 106) with radius 41.
; PLAN: r0=127(x), r1=106(y), r2=41(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 127
LDI r1, 106
LDI r2, 41
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
