; DESCRIPTION: Places a cyan circle of radius 44 at center (407, 95).
; PLAN: r0=407(x), r1=95(y), r2=44(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 407
LDI r1, 95
LDI r2, 44
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
