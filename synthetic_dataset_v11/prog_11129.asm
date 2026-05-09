; DESCRIPTION: Places a orange circle of radius 42 at center (144, 152).
; PLAN: r0=144(x), r1=152(y), r2=42(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 144
LDI r1, 152
LDI r2, 42
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
