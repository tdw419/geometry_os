; DESCRIPTION: Creates a orange circular shape at (196, 54) with radius 48.
; PLAN: r0=196(x), r1=54(y), r2=48(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 196
LDI r1, 54
LDI r2, 48
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
