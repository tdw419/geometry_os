; DESCRIPTION: Creates a green circular shape at (220, 208) with radius 10.
; PLAN: r0=220(x), r1=208(y), r2=10(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 220
LDI r1, 208
LDI r2, 10
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
