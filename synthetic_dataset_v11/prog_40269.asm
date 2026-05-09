; DESCRIPTION: Composite: . Then Draws a magenta circle centered at (159, 97) with radius 62. Then Places a yellow line segment connecting (66, 235) to (38, 73).
; PLAN: r0=159(x), r1=97(y), r2=62(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=66(x1), r1=235(y1), r2=38(x2), r3=73(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a magenta circle centered at (159, 97) with radius 62.
; PLAN: r0=159(x), r1=97(y), r2=62(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 159
LDI r1, 97
LDI r2, 62
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a yellow line segment connecting (66, 235) to (38, 73).
; PLAN: r0=66(x1), r1=235(y1), r2=38(x2), r3=73(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 235
LDI r2, 38
LDI r3, 73
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
