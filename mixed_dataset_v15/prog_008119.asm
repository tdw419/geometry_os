; DESCRIPTION: Creates a yellow circular shape at (128, 186) with radius 56.
; PLAN: r0=128(x), r1=186(y), r2=56(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 128
LDI r1, 186
LDI r2, 56
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
