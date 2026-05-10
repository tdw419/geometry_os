; DESCRIPTION: Renders a purple circular shape at (167, 146) with radius 56.
; PLAN: r0=167(x), r1=146(y), r2=56(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 167
LDI r1, 146
LDI r2, 56
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
