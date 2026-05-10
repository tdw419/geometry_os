; DESCRIPTION: Places a cyan disk with center (319, 139) and radius 36.
; PLAN: r0=319(x), r1=139(y), r2=36(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 319
LDI r1, 139
LDI r2, 36
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
