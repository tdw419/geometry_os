; DESCRIPTION: Places a black circle of radius 68 at center (413, 121).
; PLAN: r0=413(x), r1=121(y), r2=68(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 413
LDI r1, 121
LDI r2, 68
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
