; DESCRIPTION: Places a cyan circle of radius 41 at center (187, 79).
; PLAN: r0=187(x), r1=79(y), r2=41(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 187
LDI r1, 79
LDI r2, 41
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
