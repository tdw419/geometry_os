; DESCRIPTION: Places a cyan disk with center (23, 15) and radius 53.
; PLAN: r0=23(x), r1=15(y), r2=53(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 23
LDI r1, 15
LDI r2, 53
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
