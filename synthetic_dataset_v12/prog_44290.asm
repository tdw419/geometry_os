; DESCRIPTION: Creates a green circular shape at (420, 149) with radius 54.
; PLAN: r0=420(x), r1=149(y), r2=54(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 420
LDI r1, 149
LDI r2, 54
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
