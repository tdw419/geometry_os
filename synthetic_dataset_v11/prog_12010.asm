; DESCRIPTION: Places a orange circle of radius 38 at center (202, 156).
; PLAN: r0=202(x), r1=156(y), r2=38(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 202
LDI r1, 156
LDI r2, 38
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
