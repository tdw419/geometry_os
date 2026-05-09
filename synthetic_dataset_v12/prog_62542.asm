; DESCRIPTION: Places a orange circle of radius 52 at center (224, 133).
; PLAN: r0=224(x), r1=133(y), r2=52(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 224
LDI r1, 133
LDI r2, 52
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
