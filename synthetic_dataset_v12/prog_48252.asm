; DESCRIPTION: Places a cyan circle of radius 72 at center (86, 73).
; PLAN: r0=86(x), r1=73(y), r2=72(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 86
LDI r1, 73
LDI r2, 72
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
