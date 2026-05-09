; DESCRIPTION: Places a cyan circle of radius 37 at center (39, 71).
; PLAN: r0=39(x), r1=71(y), r2=37(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 39
LDI r1, 71
LDI r2, 37
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
