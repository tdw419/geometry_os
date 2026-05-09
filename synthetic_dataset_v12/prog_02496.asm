; DESCRIPTION: Creates a orange circular shape at (112, 215) with radius 19.
; PLAN: r0=112(x), r1=215(y), r2=19(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 112
LDI r1, 215
LDI r2, 19
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
