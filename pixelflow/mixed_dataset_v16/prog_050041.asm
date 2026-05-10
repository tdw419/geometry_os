; DESCRIPTION: Creates a yellow circular shape at (392, 91) with radius 28.
; PLAN: r0=392(x), r1=91(y), r2=28(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 392
LDI r1, 91
LDI r2, 28
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
