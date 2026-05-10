; DESCRIPTION: Places a cyan disk with center (175, 103) and radius 41.
; PLAN: r0=175(x), r1=103(y), r2=41(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 175
LDI r1, 103
LDI r2, 41
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
