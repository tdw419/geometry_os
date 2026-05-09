; DESCRIPTION: Places a orange circle of radius 38 at center (374, 115).
; PLAN: r0=374(x), r1=115(y), r2=38(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 374
LDI r1, 115
LDI r2, 38
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
