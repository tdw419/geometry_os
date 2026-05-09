; DESCRIPTION: Draws a purple circle centered at (175, 46) with radius 42.
; PLAN: r0=175(x), r1=46(y), r2=42(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 175
LDI r1, 46
LDI r2, 42
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
