; DESCRIPTION: Places a cyan circle of radius 52 at center (144, 137).
; PLAN: r0=144(x), r1=137(y), r2=52(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 144
LDI r1, 137
LDI r2, 52
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
