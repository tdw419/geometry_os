; DESCRIPTION: Places a orange circle of radius 35 at center (78, 146).
; PLAN: r0=78(x), r1=146(y), r2=35(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 78
LDI r1, 146
LDI r2, 35
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
