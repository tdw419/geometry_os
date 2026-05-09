; DESCRIPTION: Creates a green circular shape at (103, 187) with radius 55.
; PLAN: r0=103(x), r1=187(y), r2=55(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 103
LDI r1, 187
LDI r2, 55
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
