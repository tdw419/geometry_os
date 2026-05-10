; DESCRIPTION: Places a cyan disk with center (375, 78) and radius 32.
; PLAN: r0=375(x), r1=78(y), r2=32(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 375
LDI r1, 78
LDI r2, 32
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
