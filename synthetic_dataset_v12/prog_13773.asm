; DESCRIPTION: Places a black circle of radius 41 at center (94, 215).
; PLAN: r0=94(x), r1=215(y), r2=41(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 94
LDI r1, 215
LDI r2, 41
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
