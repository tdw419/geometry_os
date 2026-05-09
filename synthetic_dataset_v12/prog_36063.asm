; DESCRIPTION: Places a cyan circle of radius 39 at center (68, 176).
; PLAN: r0=68(x), r1=176(y), r2=39(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 68
LDI r1, 176
LDI r2, 39
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
