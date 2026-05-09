; DESCRIPTION: Composite: . Then Places a orange line segment connecting (50, 220) to (15, 44). Then Creates a green rectangular region at (13, 13) spanning 36 by 50 pixels.
; PLAN: r0=50(x1), r1=220(y1), r2=15(x2), r3=44(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=13(x), r1=13(y), r2=36(width), r3=50(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a orange line segment connecting (50, 220) to (15, 44).
; PLAN: r0=50(x1), r1=220(y1), r2=15(x2), r3=44(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 50
LDI r1, 220
LDI r2, 15
LDI r3, 44
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Creates a green rectangular region at (13, 13) spanning 36 by 50 pixels.
; PLAN: r0=13(x), r1=13(y), r2=36(width), r3=50(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 13
LDI r2, 36
LDI r3, 50
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
