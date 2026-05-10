; DESCRIPTION: Creates a purple circular shape at (168, 169) with radius 50.
; PLAN: r0=168(x), r1=169(y), r2=50(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 168
LDI r1, 169
LDI r2, 50
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
