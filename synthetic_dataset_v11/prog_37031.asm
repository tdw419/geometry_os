; DESCRIPTION: Places a orange circle of radius 41 at center (126, 152).
; PLAN: r0=126(x), r1=152(y), r2=41(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 126
LDI r1, 152
LDI r2, 41
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
