; DESCRIPTION: Creates a green circular shape at (206, 127) with radius 41.
; PLAN: r0=206(x), r1=127(y), r2=41(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 206
LDI r1, 127
LDI r2, 41
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
