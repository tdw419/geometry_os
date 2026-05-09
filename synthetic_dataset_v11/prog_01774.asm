; DESCRIPTION: Creates a yellow circular shape at (106, 150) with radius 70.
; PLAN: r0=106(x), r1=150(y), r2=70(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 106
LDI r1, 150
LDI r2, 70
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
