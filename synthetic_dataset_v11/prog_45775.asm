; DESCRIPTION: Places a cyan circle of radius 13 at center (239, 49).
; PLAN: r0=239(x), r1=49(y), r2=13(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 239
LDI r1, 49
LDI r2, 13
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
