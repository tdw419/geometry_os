; DESCRIPTION: Places a cyan circle of radius 73 at center (102, 91).
; PLAN: r0=102(x), r1=91(y), r2=73(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 102
LDI r1, 91
LDI r2, 73
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
