; DESCRIPTION: Places a orange disk with center (173, 165) and radius 36.
; PLAN: r0=173(x), r1=165(y), r2=36(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 173
LDI r1, 165
LDI r2, 36
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
