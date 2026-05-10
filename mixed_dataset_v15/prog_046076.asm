; DESCRIPTION: Places a orange circle of radius 56 at center (372, 197).
; PLAN: r0=372(x), r1=197(y), r2=56(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 372
LDI r1, 197
LDI r2, 56
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
