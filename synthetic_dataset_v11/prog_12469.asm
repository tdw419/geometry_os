; DESCRIPTION: Creates a yellow circular shape at (126, 131) with radius 72.
; PLAN: r0=126(x), r1=131(y), r2=72(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 126
LDI r1, 131
LDI r2, 72
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
