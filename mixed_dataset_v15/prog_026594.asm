; DESCRIPTION: Places a black 66x41 rectangle at position (233, 201).
; PLAN: r0=233(x), r1=201(y), r2=66(width), r3=41(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 233
LDI r1, 201
LDI r2, 66
LDI r3, 41
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
