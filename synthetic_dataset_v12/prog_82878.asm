; DESCRIPTION: Places a red circle of radius 11 at center (245, 205).
; PLAN: r0=245(x), r1=205(y), r2=11(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 245
LDI r1, 205
LDI r2, 11
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
