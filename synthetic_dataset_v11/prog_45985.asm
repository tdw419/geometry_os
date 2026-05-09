; DESCRIPTION: Composite: . Then Renders a orange line between points (145, 200) and (113, 113). Then Creates a blue circular shape at (98, 195) with radius 33.
; PLAN: r0=145(x1), r1=200(y1), r2=113(x2), r3=113(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=98(x), r1=195(y), r2=33(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Renders a orange line between points (145, 200) and (113, 113).
; PLAN: r0=145(x1), r1=200(y1), r2=113(x2), r3=113(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 145
LDI r1, 200
LDI r2, 113
LDI r3, 113
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Creates a blue circular shape at (98, 195) with radius 33.
; PLAN: r0=98(x), r1=195(y), r2=33(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 98
LDI r1, 195
LDI r2, 33
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
