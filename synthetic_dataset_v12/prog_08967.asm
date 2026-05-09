; DESCRIPTION: Creates a orange circular shape at (103, 169) with radius 56.
; PLAN: r0=103(x), r1=169(y), r2=56(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 103
LDI r1, 169
LDI r2, 56
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
