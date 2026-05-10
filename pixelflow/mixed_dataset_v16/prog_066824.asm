; DESCRIPTION: Places a cyan circle of radius 39 at center (230, 165).
; PLAN: r0=230(x), r1=165(y), r2=39(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 230
LDI r1, 165
LDI r2, 39
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
