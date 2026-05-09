; DESCRIPTION: Draws a purple circle centered at (113, 235) with radius 20.
; PLAN: r0=113(x), r1=235(y), r2=20(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 113
LDI r1, 235
LDI r2, 20
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
