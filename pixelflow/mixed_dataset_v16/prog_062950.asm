; DESCRIPTION: Places a red circle of radius 48 at center (195, 137).
; PLAN: r0=195(x), r1=137(y), r2=48(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 195
LDI r1, 137
LDI r2, 48
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
