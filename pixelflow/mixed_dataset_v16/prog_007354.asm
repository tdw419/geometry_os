; DESCRIPTION: Creates a cyan circular shape at (332, 174) with radius 58.
; PLAN: r0=332(x), r1=174(y), r2=58(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 332
LDI r1, 174
LDI r2, 58
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
