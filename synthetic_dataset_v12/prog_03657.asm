; DESCRIPTION: Creates a blue circular shape at (220, 189) with radius 50.
; PLAN: r0=220(x), r1=189(y), r2=50(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 220
LDI r1, 189
LDI r2, 50
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
