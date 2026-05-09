; DESCRIPTION: Places a cyan circle of radius 77 at center (359, 160).
; PLAN: r0=359(x), r1=160(y), r2=77(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 359
LDI r1, 160
LDI r2, 77
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
