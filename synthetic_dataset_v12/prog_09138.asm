; DESCRIPTION: Places a orange circle of radius 77 at center (167, 150).
; PLAN: r0=167(x), r1=150(y), r2=77(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 167
LDI r1, 150
LDI r2, 77
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
