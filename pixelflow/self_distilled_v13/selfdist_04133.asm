; DESCRIPTION: Places a orange disk with center (88, 173) and radius 25.
; PLAN: r0=88(x), r1=173(y), r2=25(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 88
LDI r1, 173
LDI r2, 25
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
