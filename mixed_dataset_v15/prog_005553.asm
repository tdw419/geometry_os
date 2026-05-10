; DESCRIPTION: Creates a yellow circular shape at (281, 179) with radius 41.
; PLAN: r0=281(x), r1=179(y), r2=41(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 281
LDI r1, 179
LDI r2, 41
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
