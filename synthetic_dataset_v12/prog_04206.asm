; DESCRIPTION: Creates a orange circular shape at (264, 124) with radius 65.
; PLAN: r0=264(x), r1=124(y), r2=65(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 264
LDI r1, 124
LDI r2, 65
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
