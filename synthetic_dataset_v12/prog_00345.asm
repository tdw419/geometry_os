; DESCRIPTION: Places a orange circle of radius 32 at center (408, 58).
; PLAN: r0=408(x), r1=58(y), r2=32(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 408
LDI r1, 58
LDI r2, 32
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
