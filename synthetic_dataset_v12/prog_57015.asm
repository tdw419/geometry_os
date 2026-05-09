; DESCRIPTION: Places a cyan circle of radius 61 at center (339, 71).
; PLAN: r0=339(x), r1=71(y), r2=61(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 339
LDI r1, 71
LDI r2, 61
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
