; DESCRIPTION: Places a black circle of radius 50 at center (118, 152).
; PLAN: r0=118(x), r1=152(y), r2=50(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 118
LDI r1, 152
LDI r2, 50
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
