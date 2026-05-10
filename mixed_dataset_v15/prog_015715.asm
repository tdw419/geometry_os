; DESCRIPTION: Places a orange circle of radius 17 at center (210, 206).
; PLAN: r0=210(x), r1=206(y), r2=17(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 210
LDI r1, 206
LDI r2, 17
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
