; DESCRIPTION: Composite: . Then Renders a magenta line between points (200, 254) and (135, 199). Then Draws a orange circle centered at (89, 176) with radius 42.
; PLAN: r0=200(x1), r1=254(y1), r2=135(x2), r3=199(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=89(x), r1=176(y), r2=42(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Renders a magenta line between points (200, 254) and (135, 199).
; PLAN: r0=200(x1), r1=254(y1), r2=135(x2), r3=199(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 200
LDI r1, 254
LDI r2, 135
LDI r3, 199
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Draws a orange circle centered at (89, 176) with radius 42.
; PLAN: r0=89(x), r1=176(y), r2=42(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 89
LDI r1, 176
LDI r2, 42
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
