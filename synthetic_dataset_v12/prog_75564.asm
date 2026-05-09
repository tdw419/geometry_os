; DESCRIPTION: Creates a green circular shape at (366, 205) with radius 32.
; PLAN: r0=366(x), r1=205(y), r2=32(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 366
LDI r1, 205
LDI r2, 32
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
