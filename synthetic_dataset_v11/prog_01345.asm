; DESCRIPTION: Composite: . Then Draws a orange circle centered at (100, 213) with radius 25. Then Places a yellow line segment connecting (200, 23) to (67, 160).
; PLAN: r0=100(x), r1=213(y), r2=25(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=200(x1), r1=23(y1), r2=67(x2), r3=160(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a orange circle centered at (100, 213) with radius 25.
; PLAN: r0=100(x), r1=213(y), r2=25(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 100
LDI r1, 213
LDI r2, 25
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a yellow line segment connecting (200, 23) to (67, 160).
; PLAN: r0=200(x1), r1=23(y1), r2=67(x2), r3=160(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 200
LDI r1, 23
LDI r2, 67
LDI r3, 160
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
