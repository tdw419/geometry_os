; DESCRIPTION: Places a orange circle of radius 18 at center (42, 178).
; PLAN: r0=42(x), r1=178(y), r2=18(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 42
LDI r1, 178
LDI r2, 18
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
