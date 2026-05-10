; DESCRIPTION: Places a orange disk with center (14, 57) and radius 68.
; PLAN: r0=14(x), r1=57(y), r2=68(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 14
LDI r1, 57
LDI r2, 68
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
