; DESCRIPTION: Places a cyan circle of radius 62 at center (84, 115).
; PLAN: r0=84(x), r1=115(y), r2=62(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 84
LDI r1, 115
LDI r2, 62
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
