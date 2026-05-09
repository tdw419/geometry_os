; DESCRIPTION: Draws a magenta circle centered at (235, 187) with radius 57.
; PLAN: r0=235(x), r1=187(y), r2=57(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 235
LDI r1, 187
LDI r2, 57
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
