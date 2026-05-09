; DESCRIPTION: Places a cyan circle of radius 41 at center (206, 105).
; PLAN: r0=206(x), r1=105(y), r2=41(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 206
LDI r1, 105
LDI r2, 41
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
