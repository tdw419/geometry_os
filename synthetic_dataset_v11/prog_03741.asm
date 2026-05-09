; DESCRIPTION: Composite: . Then Creates a orange circular shape at (110, 159) with radius 79. Then Draws a purple line from (66, 163) to (103, 78).
; PLAN: r0=110(x), r1=159(y), r2=79(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=66(x1), r1=163(y1), r2=103(x2), r3=78(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Creates a orange circular shape at (110, 159) with radius 79.
; PLAN: r0=110(x), r1=159(y), r2=79(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 110
LDI r1, 159
LDI r2, 79
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Draws a purple line from (66, 163) to (103, 78).
; PLAN: r0=66(x1), r1=163(y1), r2=103(x2), r3=78(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 163
LDI r2, 103
LDI r3, 78
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
