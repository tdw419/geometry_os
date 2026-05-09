; DESCRIPTION: Places a orange circle of radius 77 at center (271, 136).
; PLAN: r0=271(x), r1=136(y), r2=77(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 271
LDI r1, 136
LDI r2, 77
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
