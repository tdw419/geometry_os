; DESCRIPTION: Draws a purple circle centered at (260, 53) with radius 42.
; PLAN: r0=260(x), r1=53(y), r2=42(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 260
LDI r1, 53
LDI r2, 42
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
