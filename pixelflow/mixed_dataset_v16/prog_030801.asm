; DESCRIPTION: Places a cyan circle of radius 11 at center (248, 27).
; PLAN: r0=248(x), r1=27(y), r2=11(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 248
LDI r1, 27
LDI r2, 11
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
