; DESCRIPTION: Places a cyan circle of radius 48 at center (88, 82).
; PLAN: r0=88(x), r1=82(y), r2=48(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 88
LDI r1, 82
LDI r2, 48
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
