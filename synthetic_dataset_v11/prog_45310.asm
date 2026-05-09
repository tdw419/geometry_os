; DESCRIPTION: Places a cyan circle of radius 49 at center (143, 73).
; PLAN: r0=143(x), r1=73(y), r2=49(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 143
LDI r1, 73
LDI r2, 49
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
