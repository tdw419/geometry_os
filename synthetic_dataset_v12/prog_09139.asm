; DESCRIPTION: Places a orange circle of radius 68 at center (192, 166).
; PLAN: r0=192(x), r1=166(y), r2=68(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 192
LDI r1, 166
LDI r2, 68
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
