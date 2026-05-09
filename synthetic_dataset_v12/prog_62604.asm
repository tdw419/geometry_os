; DESCRIPTION: Places a cyan circle of radius 78 at center (151, 140).
; PLAN: r0=151(x), r1=140(y), r2=78(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 151
LDI r1, 140
LDI r2, 78
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
