; DESCRIPTION: Places a cyan circle of radius 12 at center (349, 46).
; PLAN: r0=349(x), r1=46(y), r2=12(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 349
LDI r1, 46
LDI r2, 12
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
