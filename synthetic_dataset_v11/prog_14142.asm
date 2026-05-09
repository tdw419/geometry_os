; DESCRIPTION: Places a orange circle of radius 23 at center (42, 96).
; PLAN: r0=42(x), r1=96(y), r2=23(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 42
LDI r1, 96
LDI r2, 23
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
