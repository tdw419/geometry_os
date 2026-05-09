; DESCRIPTION: Places a cyan circle of radius 61 at center (122, 137).
; PLAN: r0=122(x), r1=137(y), r2=61(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 122
LDI r1, 137
LDI r2, 61
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
