; DESCRIPTION: Places a cyan circle of radius 51 at center (84, 62).
; PLAN: r0=84(x), r1=62(y), r2=51(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 84
LDI r1, 62
LDI r2, 51
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
