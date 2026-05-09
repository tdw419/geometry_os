; DESCRIPTION: Places a cyan circle of radius 57 at center (87, 90).
; PLAN: r0=87(x), r1=90(y), r2=57(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 87
LDI r1, 90
LDI r2, 57
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
