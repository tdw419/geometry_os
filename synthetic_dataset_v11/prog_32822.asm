; DESCRIPTION: Creates a red circular shape at (86, 160) with radius 30.
; PLAN: r0=86(x), r1=160(y), r2=30(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 86
LDI r1, 160
LDI r2, 30
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
