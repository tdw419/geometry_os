; DESCRIPTION: Creates a purple circular shape at (214, 190) with radius 59.
; PLAN: r0=214(x), r1=190(y), r2=59(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 214
LDI r1, 190
LDI r2, 59
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
