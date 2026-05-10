; DESCRIPTION: Creates a orange circular shape at (315, 84) with radius 42.
; PLAN: r0=315(x), r1=84(y), r2=42(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 315
LDI r1, 84
LDI r2, 42
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
