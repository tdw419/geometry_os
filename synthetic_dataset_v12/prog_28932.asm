; DESCRIPTION: Creates a cyan circular shape at (342, 203) with radius 52.
; PLAN: r0=342(x), r1=203(y), r2=52(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 342
LDI r1, 203
LDI r2, 52
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
