; DESCRIPTION: Places a orange circle of radius 60 at center (160, 118).
; PLAN: r0=160(x), r1=118(y), r2=60(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 160
LDI r1, 118
LDI r2, 60
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
