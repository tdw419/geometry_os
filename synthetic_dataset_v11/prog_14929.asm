; DESCRIPTION: Composite: . Then Draws a blue circle centered at (181, 89) with radius 63. Then Draws a blue line from (128, 25) to (204, 246).
; PLAN: r0=181(x), r1=89(y), r2=63(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=128(x1), r1=25(y1), r2=204(x2), r3=246(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a blue circle centered at (181, 89) with radius 63.
; PLAN: r0=181(x), r1=89(y), r2=63(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 181
LDI r1, 89
LDI r2, 63
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Draws a blue line from (128, 25) to (204, 246).
; PLAN: r0=128(x1), r1=25(y1), r2=204(x2), r3=246(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 25
LDI r2, 204
LDI r3, 246
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
