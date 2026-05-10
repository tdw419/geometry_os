; DESCRIPTION: Renders a purple circular shape at (340, 20) with radius 68.
; PLAN: r0=340(x), r1=20(y), r2=68(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 340
LDI r1, 20
LDI r2, 68
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
