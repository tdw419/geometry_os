; DESCRIPTION: Creates a orange circular shape at (374, 131) with radius 77.
; PLAN: r0=374(x), r1=131(y), r2=77(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 374
LDI r1, 131
LDI r2, 77
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
