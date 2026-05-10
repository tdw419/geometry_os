; DESCRIPTION: Renders a purple circular shape at (231, 94) with radius 43.
; PLAN: r0=231(x), r1=94(y), r2=43(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 231
LDI r1, 94
LDI r2, 43
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
