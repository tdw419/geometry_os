; DESCRIPTION: Places a orange circle of radius 12 at center (202, 91).
; PLAN: r0=202(x), r1=91(y), r2=12(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 202
LDI r1, 91
LDI r2, 12
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
