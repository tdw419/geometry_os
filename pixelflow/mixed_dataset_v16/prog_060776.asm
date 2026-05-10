; DESCRIPTION: Places a cyan disk with center (91, 41) and radius 65.
; PLAN: r0=91(x), r1=41(y), r2=65(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 91
LDI r1, 41
LDI r2, 65
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
