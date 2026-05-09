; DESCRIPTION: Places a orange circle of radius 50 at center (379, 65).
; PLAN: r0=379(x), r1=65(y), r2=50(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 379
LDI r1, 65
LDI r2, 50
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
