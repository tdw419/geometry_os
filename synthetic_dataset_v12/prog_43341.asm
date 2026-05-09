; DESCRIPTION: Places a black circle of radius 39 at center (295, 100).
; PLAN: r0=295(x), r1=100(y), r2=39(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 295
LDI r1, 100
LDI r2, 39
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
