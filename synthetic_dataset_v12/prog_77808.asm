; DESCRIPTION: Places a red circle of radius 23 at center (241, 50).
; PLAN: r0=241(x), r1=50(y), r2=23(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 241
LDI r1, 50
LDI r2, 23
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
