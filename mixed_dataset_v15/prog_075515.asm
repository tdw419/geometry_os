; DESCRIPTION: Places a cyan circle of radius 21 at center (273, 46).
; PLAN: r0=273(x), r1=46(y), r2=21(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 273
LDI r1, 46
LDI r2, 21
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
