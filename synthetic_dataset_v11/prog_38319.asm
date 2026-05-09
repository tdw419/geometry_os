; DESCRIPTION: Places a red circle of radius 32 at center (147, 195).
; PLAN: r0=147(x), r1=195(y), r2=32(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 147
LDI r1, 195
LDI r2, 32
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
