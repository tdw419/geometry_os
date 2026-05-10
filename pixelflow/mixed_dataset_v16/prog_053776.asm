; DESCRIPTION: Places a orange circle of radius 48 at center (151, 166).
; PLAN: r0=151(x), r1=166(y), r2=48(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 151
LDI r1, 166
LDI r2, 48
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
