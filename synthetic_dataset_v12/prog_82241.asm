; DESCRIPTION: Creates a orange circular shape at (473, 127) with radius 38.
; PLAN: r0=473(x), r1=127(y), r2=38(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 473
LDI r1, 127
LDI r2, 38
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
