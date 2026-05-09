; DESCRIPTION: Places a cyan circle of radius 24 at center (254, 49).
; PLAN: r0=254(x), r1=49(y), r2=24(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 254
LDI r1, 49
LDI r2, 24
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
