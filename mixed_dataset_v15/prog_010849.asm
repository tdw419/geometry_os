; DESCRIPTION: Places a cyan circle of radius 34 at center (382, 176).
; PLAN: r0=382(x), r1=176(y), r2=34(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 382
LDI r1, 176
LDI r2, 34
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
