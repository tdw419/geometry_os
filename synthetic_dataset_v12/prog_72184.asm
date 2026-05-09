; DESCRIPTION: Creates a purple circular shape at (103, 190) with radius 25.
; PLAN: r0=103(x), r1=190(y), r2=25(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 103
LDI r1, 190
LDI r2, 25
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
