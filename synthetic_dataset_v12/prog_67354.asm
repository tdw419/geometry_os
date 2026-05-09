; DESCRIPTION: Places a orange circle of radius 68 at center (74, 148).
; PLAN: r0=74(x), r1=148(y), r2=68(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 74
LDI r1, 148
LDI r2, 68
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
