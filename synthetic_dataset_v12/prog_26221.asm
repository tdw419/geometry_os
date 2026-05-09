; DESCRIPTION: Creates a red circular shape at (130, 198) with radius 12.
; PLAN: r0=130(x), r1=198(y), r2=12(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 130
LDI r1, 198
LDI r2, 12
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
