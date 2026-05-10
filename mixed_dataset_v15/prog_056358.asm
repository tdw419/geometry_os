; DESCRIPTION: Draws a purple circle centered at (272, 126) with radius 68.
; PLAN: r0=272(x), r1=126(y), r2=68(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 272
LDI r1, 126
LDI r2, 68
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
