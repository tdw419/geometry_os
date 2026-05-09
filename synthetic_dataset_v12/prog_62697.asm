; DESCRIPTION: Creates a yellow circular shape at (328, 194) with radius 56.
; PLAN: r0=328(x), r1=194(y), r2=56(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 328
LDI r1, 194
LDI r2, 56
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
