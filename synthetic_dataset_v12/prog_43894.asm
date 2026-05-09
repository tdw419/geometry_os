; DESCRIPTION: Places a orange circle of radius 12 at center (207, 206).
; PLAN: r0=207(x), r1=206(y), r2=12(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 207
LDI r1, 206
LDI r2, 12
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
