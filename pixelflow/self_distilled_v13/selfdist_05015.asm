; DESCRIPTION: Draws a cyan circle centered at (241, 137) with radius 80.
; PLAN: r0=241(x), r1=137(y), r2=80(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 241
LDI r1, 137
LDI r2, 80
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
