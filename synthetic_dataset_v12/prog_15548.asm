; DESCRIPTION: Places a cyan circle of radius 43 at center (309, 78).
; PLAN: r0=309(x), r1=78(y), r2=43(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 309
LDI r1, 78
LDI r2, 43
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
