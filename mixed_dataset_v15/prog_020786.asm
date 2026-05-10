; DESCRIPTION: Places a cyan circle of radius 12 at center (41, 27).
; PLAN: r0=41(x), r1=27(y), r2=12(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 41
LDI r1, 27
LDI r2, 12
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
