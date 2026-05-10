; DESCRIPTION: Places a orange circle of radius 76 at center (222, 146).
; PLAN: r0=222(x), r1=146(y), r2=76(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 222
LDI r1, 146
LDI r2, 76
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
