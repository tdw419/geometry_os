; DESCRIPTION: Places a red circle of radius 27 at center (304, 205).
; PLAN: r0=304(x), r1=205(y), r2=27(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 304
LDI r1, 205
LDI r2, 27
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
