; DESCRIPTION: Places a cyan circle of radius 36 at center (323, 136).
; PLAN: r0=323(x), r1=136(y), r2=36(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 323
LDI r1, 136
LDI r2, 36
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
