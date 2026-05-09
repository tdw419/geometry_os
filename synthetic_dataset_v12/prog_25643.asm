; DESCRIPTION: Creates a orange circular shape at (237, 154) with radius 11.
; PLAN: r0=237(x), r1=154(y), r2=11(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 237
LDI r1, 154
LDI r2, 11
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
