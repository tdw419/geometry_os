; DESCRIPTION: Composite: . Then Creates a blue circular shape at (174, 114) with radius 78. Then Places a orange line segment connecting (225, 100) to (110, 186).
; PLAN: r0=174(x), r1=114(y), r2=78(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=225(x1), r1=100(y1), r2=110(x2), r3=186(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Creates a blue circular shape at (174, 114) with radius 78.
; PLAN: r0=174(x), r1=114(y), r2=78(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 174
LDI r1, 114
LDI r2, 78
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a orange line segment connecting (225, 100) to (110, 186).
; PLAN: r0=225(x1), r1=100(y1), r2=110(x2), r3=186(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 225
LDI r1, 100
LDI r2, 110
LDI r3, 186
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
