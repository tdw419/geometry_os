; DESCRIPTION: Places a red circle of radius 50 at center (241, 160).
; PLAN: r0=241(x), r1=160(y), r2=50(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 241
LDI r1, 160
LDI r2, 50
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
