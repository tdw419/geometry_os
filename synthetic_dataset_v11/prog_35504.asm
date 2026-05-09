; DESCRIPTION: Composite: . Then Places a black line segment connecting (180, 48) to (184, 207). Then Creates a magenta circular shape at (155, 81) with radius 74.
; PLAN: r0=180(x1), r1=48(y1), r2=184(x2), r3=207(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=155(x), r1=81(y), r2=74(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a black line segment connecting (180, 48) to (184, 207).
; PLAN: r0=180(x1), r1=48(y1), r2=184(x2), r3=207(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 180
LDI r1, 48
LDI r2, 184
LDI r3, 207
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Creates a magenta circular shape at (155, 81) with radius 74.
; PLAN: r0=155(x), r1=81(y), r2=74(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 155
LDI r1, 81
LDI r2, 74
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
