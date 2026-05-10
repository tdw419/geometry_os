; DESCRIPTION: Creates a blue circular shape at (474, 80) with radius 10.
; PLAN: r0=474(x), r1=80(y), r2=10(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 474
LDI r1, 80
LDI r2, 10
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
