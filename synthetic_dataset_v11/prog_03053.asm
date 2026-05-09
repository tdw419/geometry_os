; DESCRIPTION: Composite: . Then Draws a purple circle centered at (144, 192) with radius 10. Then Places a magenta line segment connecting (251, 113) to (210, 102).
; PLAN: r0=144(x), r1=192(y), r2=10(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=251(x1), r1=113(y1), r2=210(x2), r3=102(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a purple circle centered at (144, 192) with radius 10.
; PLAN: r0=144(x), r1=192(y), r2=10(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 144
LDI r1, 192
LDI r2, 10
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a magenta line segment connecting (251, 113) to (210, 102).
; PLAN: r0=251(x1), r1=113(y1), r2=210(x2), r3=102(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 251
LDI r1, 113
LDI r2, 210
LDI r3, 102
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
