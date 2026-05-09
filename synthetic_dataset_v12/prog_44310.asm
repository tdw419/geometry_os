; DESCRIPTION: Creates a purple circular shape at (276, 111) with radius 80.
; PLAN: r0=276(x), r1=111(y), r2=80(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 276
LDI r1, 111
LDI r2, 80
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
