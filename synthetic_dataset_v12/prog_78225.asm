; DESCRIPTION: Places a cyan circle of radius 55 at center (240, 99).
; PLAN: r0=240(x), r1=99(y), r2=55(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 240
LDI r1, 99
LDI r2, 55
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
