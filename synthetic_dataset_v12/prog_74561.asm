; DESCRIPTION: Creates a green circular shape at (350, 208) with radius 22.
; PLAN: r0=350(x), r1=208(y), r2=22(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 350
LDI r1, 208
LDI r2, 22
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
