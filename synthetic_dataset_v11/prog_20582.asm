; DESCRIPTION: Creates a cyan circular shape at (131, 137) with radius 55.
; PLAN: r0=131(x), r1=137(y), r2=55(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 131
LDI r1, 137
LDI r2, 55
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
