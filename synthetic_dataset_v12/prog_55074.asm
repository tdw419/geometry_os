; DESCRIPTION: Places a cyan circle of radius 29 at center (459, 163).
; PLAN: r0=459(x), r1=163(y), r2=29(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 459
LDI r1, 163
LDI r2, 29
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
