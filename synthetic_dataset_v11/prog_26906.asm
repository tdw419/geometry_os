; DESCRIPTION: Places a red circle of radius 64 at center (181, 176).
; PLAN: r0=181(x), r1=176(y), r2=64(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 181
LDI r1, 176
LDI r2, 64
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
