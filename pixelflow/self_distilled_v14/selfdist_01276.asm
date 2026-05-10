; DESCRIPTION: Renders a purple circular shape at (353, 46) with radius 65.
; PLAN: r0=353(x), r1=46(y), r2=65(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 353
LDI r1, 46
LDI r2, 65
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
