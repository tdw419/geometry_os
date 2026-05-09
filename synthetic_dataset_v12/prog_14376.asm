; DESCRIPTION: Places a cyan circle of radius 13 at center (312, 203).
; PLAN: r0=312(x), r1=203(y), r2=13(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 312
LDI r1, 203
LDI r2, 13
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
