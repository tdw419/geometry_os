; DESCRIPTION: Creates a yellow circular shape at (270, 187) with radius 12.
; PLAN: r0=270(x), r1=187(y), r2=12(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 270
LDI r1, 187
LDI r2, 12
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
