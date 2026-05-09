; DESCRIPTION: Places a cyan circle of radius 26 at center (193, 46).
; PLAN: r0=193(x), r1=46(y), r2=26(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 193
LDI r1, 46
LDI r2, 26
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
