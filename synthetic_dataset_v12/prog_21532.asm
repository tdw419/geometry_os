; DESCRIPTION: Places a orange circle of radius 45 at center (340, 86).
; PLAN: r0=340(x), r1=86(y), r2=45(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 340
LDI r1, 86
LDI r2, 45
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
