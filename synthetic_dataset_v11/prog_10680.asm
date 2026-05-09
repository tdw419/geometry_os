; DESCRIPTION: Places a red circle of radius 76 at center (144, 86).
; PLAN: r0=144(x), r1=86(y), r2=76(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 144
LDI r1, 86
LDI r2, 76
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
