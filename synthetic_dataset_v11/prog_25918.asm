; DESCRIPTION: Draws a purple circle centered at (197, 124) with radius 42.
; PLAN: r0=197(x), r1=124(y), r2=42(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 197
LDI r1, 124
LDI r2, 42
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
