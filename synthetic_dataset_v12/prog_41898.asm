; DESCRIPTION: Places a cyan circle of radius 78 at center (315, 123).
; PLAN: r0=315(x), r1=123(y), r2=78(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 315
LDI r1, 123
LDI r2, 78
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
