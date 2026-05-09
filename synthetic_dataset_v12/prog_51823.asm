; DESCRIPTION: Places a orange circle of radius 18 at center (354, 127).
; PLAN: r0=354(x), r1=127(y), r2=18(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 354
LDI r1, 127
LDI r2, 18
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
