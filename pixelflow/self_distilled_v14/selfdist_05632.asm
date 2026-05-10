; DESCRIPTION: Places a cyan disk with center (30, 140) and radius 11.
; PLAN: r0=30(x), r1=140(y), r2=11(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 30
LDI r1, 140
LDI r2, 11
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
