; DESCRIPTION: Creates a yellow circular shape at (206, 190) with radius 13.
; PLAN: r0=206(x), r1=190(y), r2=13(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 206
LDI r1, 190
LDI r2, 13
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
