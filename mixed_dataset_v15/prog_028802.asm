; DESCRIPTION: Places a orange circle of radius 16 at center (117, 175).
; PLAN: r0=117(x), r1=175(y), r2=16(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 117
LDI r1, 175
LDI r2, 16
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
