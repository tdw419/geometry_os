; DESCRIPTION: Places a cyan disk with center (10, 66) and radius 18.
; PLAN: r0=10(x), r1=66(y), r2=18(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 10
LDI r1, 66
LDI r2, 18
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
