; DESCRIPTION: Places a orange disk with center (150, 101) and radius 46.
; PLAN: r0=150(x), r1=101(y), r2=46(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 150
LDI r1, 101
LDI r2, 46
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
