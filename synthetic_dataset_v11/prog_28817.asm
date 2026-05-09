; DESCRIPTION: Places a orange circle of radius 62 at center (118, 113).
; PLAN: r0=118(x), r1=113(y), r2=62(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 118
LDI r1, 113
LDI r2, 62
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
