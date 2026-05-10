; DESCRIPTION: Draws a purple circle centered at (308, 3) with radius 50.
; PLAN: r0=308(x), r1=3(y), r2=50(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 308
LDI r1, 3
LDI r2, 50
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
