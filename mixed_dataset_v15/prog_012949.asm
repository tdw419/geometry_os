; DESCRIPTION: Creates a orange circular shape at (350, 160) with radius 49.
; PLAN: r0=350(x), r1=160(y), r2=49(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 350
LDI r1, 160
LDI r2, 49
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
