; DESCRIPTION: Renders a purple circular shape at (386, 73) with radius 66.
; PLAN: r0=386(x), r1=73(y), r2=66(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 386
LDI r1, 73
LDI r2, 66
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
