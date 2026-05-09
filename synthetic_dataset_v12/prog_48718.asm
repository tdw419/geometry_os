; DESCRIPTION: Places a orange circle of radius 42 at center (279, 49).
; PLAN: r0=279(x), r1=49(y), r2=42(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 279
LDI r1, 49
LDI r2, 42
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
