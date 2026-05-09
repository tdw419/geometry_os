; DESCRIPTION: Creates a black circular shape at (328, 160) with radius 60.
; PLAN: r0=328(x), r1=160(y), r2=60(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 328
LDI r1, 160
LDI r2, 60
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
