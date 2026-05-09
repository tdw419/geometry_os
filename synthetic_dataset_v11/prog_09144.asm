; DESCRIPTION: Places a orange circle of radius 58 at center (141, 198).
; PLAN: r0=141(x), r1=198(y), r2=58(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 141
LDI r1, 198
LDI r2, 58
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
