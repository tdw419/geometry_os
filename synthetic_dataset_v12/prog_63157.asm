; DESCRIPTION: Creates a purple circular shape at (340, 190) with radius 42.
; PLAN: r0=340(x), r1=190(y), r2=42(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 340
LDI r1, 190
LDI r2, 42
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
