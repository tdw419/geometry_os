; DESCRIPTION: Creates a yellow circular shape at (110, 144) with radius 52.
; PLAN: r0=110(x), r1=144(y), r2=52(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 110
LDI r1, 144
LDI r2, 52
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
