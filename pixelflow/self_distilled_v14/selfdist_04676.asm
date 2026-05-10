; DESCRIPTION: Places a orange disk with center (173, 32) and radius 44.
; PLAN: r0=173(x), r1=32(y), r2=44(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 173
LDI r1, 32
LDI r2, 44
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
