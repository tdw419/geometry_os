; DESCRIPTION: Places a orange circle of radius 33 at center (114, 206).
; PLAN: r0=114(x), r1=206(y), r2=33(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 114
LDI r1, 206
LDI r2, 33
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
