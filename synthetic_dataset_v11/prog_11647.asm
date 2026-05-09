; DESCRIPTION: Composite: . Then Renders a magenta line between points (110, 64) and (233, 199). Then Creates a magenta circular shape at (102, 229) with radius 13.
; PLAN: r0=110(x1), r1=64(y1), r2=233(x2), r3=199(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=102(x), r1=229(y), r2=13(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Renders a magenta line between points (110, 64) and (233, 199).
; PLAN: r0=110(x1), r1=64(y1), r2=233(x2), r3=199(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 110
LDI r1, 64
LDI r2, 233
LDI r3, 199
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Creates a magenta circular shape at (102, 229) with radius 13.
; PLAN: r0=102(x), r1=229(y), r2=13(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 102
LDI r1, 229
LDI r2, 13
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
