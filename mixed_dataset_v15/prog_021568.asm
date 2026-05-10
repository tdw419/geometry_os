; DESCRIPTION: Creates a orange circular shape at (260, 55) with radius 43.
; PLAN: r0=260(x), r1=55(y), r2=43(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 260
LDI r1, 55
LDI r2, 43
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
