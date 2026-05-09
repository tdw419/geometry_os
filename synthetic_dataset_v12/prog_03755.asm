; DESCRIPTION: Places a black circle of radius 41 at center (281, 97).
; PLAN: r0=281(x), r1=97(y), r2=41(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 281
LDI r1, 97
LDI r2, 41
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
