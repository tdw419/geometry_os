; DESCRIPTION: Places a cyan circle of radius 57 at center (72, 144).
; PLAN: r0=72(x), r1=144(y), r2=57(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 72
LDI r1, 144
LDI r2, 57
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
