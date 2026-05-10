; DESCRIPTION: Renders a purple circular shape at (301, 146) with radius 43.
; PLAN: r0=301(x), r1=146(y), r2=43(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 301
LDI r1, 146
LDI r2, 43
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
