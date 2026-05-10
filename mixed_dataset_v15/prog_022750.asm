; DESCRIPTION: Places a cyan circle of radius 24 at center (57, 56).
; PLAN: r0=57(x), r1=56(y), r2=24(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 57
LDI r1, 56
LDI r2, 24
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
