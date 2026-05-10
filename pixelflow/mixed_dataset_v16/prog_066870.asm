; DESCRIPTION: Creates a purple circular shape at (156, 150) with radius 80.
; PLAN: r0=156(x), r1=150(y), r2=80(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 156
LDI r1, 150
LDI r2, 80
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
