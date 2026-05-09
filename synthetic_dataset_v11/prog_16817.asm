; DESCRIPTION: Composite: . Then Places a orange line segment connecting (219, 20) to (63, 183). Then Places a magenta 22x55 rectangle at position (60, 29).
; PLAN: r0=219(x1), r1=20(y1), r2=63(x2), r3=183(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=60(x), r1=29(y), r2=22(width), r3=55(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a orange line segment connecting (219, 20) to (63, 183).
; PLAN: r0=219(x1), r1=20(y1), r2=63(x2), r3=183(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 219
LDI r1, 20
LDI r2, 63
LDI r3, 183
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a magenta 22x55 rectangle at position (60, 29).
; PLAN: r0=60(x), r1=29(y), r2=22(width), r3=55(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 29
LDI r2, 22
LDI r3, 55
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
