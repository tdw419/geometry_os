; DESCRIPTION: Composite: . Then Draws a purple circle centered at (83, 83) with radius 78. Then Places a magenta line segment connecting (128, 186) to (3, 39).
; PLAN: r0=83(x), r1=83(y), r2=78(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=128(x1), r1=186(y1), r2=3(x2), r3=39(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a purple circle centered at (83, 83) with radius 78.
; PLAN: r0=83(x), r1=83(y), r2=78(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 83
LDI r1, 83
LDI r2, 78
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a magenta line segment connecting (128, 186) to (3, 39).
; PLAN: r0=128(x1), r1=186(y1), r2=3(x2), r3=39(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 186
LDI r2, 3
LDI r3, 39
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
