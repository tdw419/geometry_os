; DESCRIPTION: Creates a yellow circular shape at (303, 187) with radius 35.
; PLAN: r0=303(x), r1=187(y), r2=35(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 303
LDI r1, 187
LDI r2, 35
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
