; DESCRIPTION: Creates a blue circular shape at (28, 50) with radius 25.
; PLAN: r0=28(x), r1=50(y), r2=25(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 28
LDI r1, 50
LDI r2, 25
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
