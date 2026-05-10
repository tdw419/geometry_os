; DESCRIPTION: Creates a blue circular shape at (386, 152) with radius 62.
; PLAN: r0=386(x), r1=152(y), r2=62(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 386
LDI r1, 152
LDI r2, 62
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
