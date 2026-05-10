; DESCRIPTION: Places a orange disk with center (372, 63) and radius 50.
; PLAN: r0=372(x), r1=63(y), r2=50(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 372
LDI r1, 63
LDI r2, 50
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
