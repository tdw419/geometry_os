; DESCRIPTION: Draws a purple circle centered at (146, 196) with radius 53.
; PLAN: r0=146(x), r1=196(y), r2=53(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 146
LDI r1, 196
LDI r2, 53
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
