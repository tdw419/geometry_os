; DESCRIPTION: Composite: . Then Renders a black line between points (113, 217) and (192, 176). Then Draws a magenta circle centered at (204, 180) with radius 24.
; PLAN: r0=113(x1), r1=217(y1), r2=192(x2), r3=176(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=204(x), r1=180(y), r2=24(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Renders a black line between points (113, 217) and (192, 176).
; PLAN: r0=113(x1), r1=217(y1), r2=192(x2), r3=176(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 113
LDI r1, 217
LDI r2, 192
LDI r3, 176
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Draws a magenta circle centered at (204, 180) with radius 24.
; PLAN: r0=204(x), r1=180(y), r2=24(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 204
LDI r1, 180
LDI r2, 24
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
