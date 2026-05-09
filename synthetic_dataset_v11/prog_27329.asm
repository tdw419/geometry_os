; DESCRIPTION: Places a orange circle of radius 27 at center (205, 178).
; PLAN: r0=205(x), r1=178(y), r2=27(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 205
LDI r1, 178
LDI r2, 27
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
