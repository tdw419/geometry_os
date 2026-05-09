; DESCRIPTION: Places a orange circle of radius 25 at center (103, 104).
; PLAN: r0=103(x), r1=104(y), r2=25(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 103
LDI r1, 104
LDI r2, 25
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
