; DESCRIPTION: Draws a purple circle at (128, 128) with radius 60 then a white line from (0, 0) to (255, 255).
; PLAN: r0=128(x1), r1=128(y), r2=60(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 128
LDI r1, 128
LDI r2, 60
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
