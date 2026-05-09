; DESCRIPTION: Places a orange circle of radius 14 at center (195, 186).
; PLAN: r0=195(x), r1=186(y), r2=14(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 195
LDI r1, 186
LDI r2, 14
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
