; DESCRIPTION: Places a black circle of radius 21 at center (410, 35).
; PLAN: r0=410(x), r1=35(y), r2=21(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 410
LDI r1, 35
LDI r2, 21
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
