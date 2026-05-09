; DESCRIPTION: Composite: . Then Draws a orange circle centered at (66, 87) with radius 25. Then Places a purple line segment connecting (150, 179) to (14, 15).
; PLAN: r0=66(x), r1=87(y), r2=25(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=150(x1), r1=179(y1), r2=14(x2), r3=15(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a orange circle centered at (66, 87) with radius 25.
; PLAN: r0=66(x), r1=87(y), r2=25(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 66
LDI r1, 87
LDI r2, 25
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a purple line segment connecting (150, 179) to (14, 15).
; PLAN: r0=150(x1), r1=179(y1), r2=14(x2), r3=15(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 150
LDI r1, 179
LDI r2, 14
LDI r3, 15
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
