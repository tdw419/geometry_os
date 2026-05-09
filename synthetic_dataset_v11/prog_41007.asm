; DESCRIPTION: Places a cyan circle of radius 54 at center (187, 82).
; PLAN: r0=187(x), r1=82(y), r2=54(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 187
LDI r1, 82
LDI r2, 54
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
