; DESCRIPTION: Draws a purple circle centered at (70, 131) with radius 27.
; PLAN: r0=70(x), r1=131(y), r2=27(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 70
LDI r1, 131
LDI r2, 27
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
