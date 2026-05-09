; DESCRIPTION: Composite: . Then Draws a orange line from (206, 37) to (139, 252). Then Places a white circle of radius 78 at center (155, 132).
; PLAN: r0=206(x1), r1=37(y1), r2=139(x2), r3=252(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=155(x), r1=132(y), r2=78(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Draws a orange line from (206, 37) to (139, 252).
; PLAN: r0=206(x1), r1=37(y1), r2=139(x2), r3=252(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 206
LDI r1, 37
LDI r2, 139
LDI r3, 252
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a white circle of radius 78 at center (155, 132).
; PLAN: r0=155(x), r1=132(y), r2=78(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 155
LDI r1, 132
LDI r2, 78
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
