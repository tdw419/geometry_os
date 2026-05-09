; DESCRIPTION: Creates a yellow circular shape at (123, 186) with radius 41.
; PLAN: r0=123(x), r1=186(y), r2=41(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 123
LDI r1, 186
LDI r2, 41
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
