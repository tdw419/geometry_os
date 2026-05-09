; DESCRIPTION: Places a red circle of radius 42 at center (339, 99).
; PLAN: r0=339(x), r1=99(y), r2=42(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 339
LDI r1, 99
LDI r2, 42
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
