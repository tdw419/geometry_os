; DESCRIPTION: Places a orange circle of radius 16 at center (44, 42).
; PLAN: r0=44(x), r1=42(y), r2=16(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 44
LDI r1, 42
LDI r2, 16
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
