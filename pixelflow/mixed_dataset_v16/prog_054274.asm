; DESCRIPTION: Creates a orange circular shape at (305, 58) with radius 40.
; PLAN: r0=305(x), r1=58(y), r2=40(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 305
LDI r1, 58
LDI r2, 40
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
