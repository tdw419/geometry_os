; DESCRIPTION: Places a red circle of radius 14 at center (376, 36).
; PLAN: r0=376(x), r1=36(y), r2=14(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 376
LDI r1, 36
LDI r2, 14
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
