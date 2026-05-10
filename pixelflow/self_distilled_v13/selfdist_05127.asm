; DESCRIPTION: Renders a purple circular shape at (252, 186) with radius 45.
; PLAN: r0=252(x), r1=186(y), r2=45(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 252
LDI r1, 186
LDI r2, 45
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
