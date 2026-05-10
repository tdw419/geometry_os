; DESCRIPTION: Places a red circle of radius 49 at center (128, 123).
; PLAN: r0=128(x), r1=123(y), r2=49(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 128
LDI r1, 123
LDI r2, 49
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
