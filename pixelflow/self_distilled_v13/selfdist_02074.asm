; DESCRIPTION: Places a cyan disk with center (37, 76) and radius 28.
; PLAN: r0=37(x), r1=76(y), r2=28(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 37
LDI r1, 76
LDI r2, 28
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
