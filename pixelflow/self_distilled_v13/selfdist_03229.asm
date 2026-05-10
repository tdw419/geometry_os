; DESCRIPTION: Renders a purple circular shape at (207, 50) with radius 27.
; PLAN: r0=207(x), r1=50(y), r2=27(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 207
LDI r1, 50
LDI r2, 27
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
