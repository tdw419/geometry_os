; DESCRIPTION: Places a orange circle of radius 52 at center (198, 77).
; PLAN: r0=198(x), r1=77(y), r2=52(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 198
LDI r1, 77
LDI r2, 52
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
