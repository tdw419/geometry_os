; DESCRIPTION: Composite: . Then Places a green circle of radius 29 at center (79, 52). Then Places a orange line segment connecting (27, 178) to (22, 97).
; PLAN: r0=79(x), r1=52(y), r2=29(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=27(x1), r1=178(y1), r2=22(x2), r3=97(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a green circle of radius 29 at center (79, 52).
; PLAN: r0=79(x), r1=52(y), r2=29(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 79
LDI r1, 52
LDI r2, 29
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a orange line segment connecting (27, 178) to (22, 97).
; PLAN: r0=27(x1), r1=178(y1), r2=22(x2), r3=97(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 27
LDI r1, 178
LDI r2, 22
LDI r3, 97
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
