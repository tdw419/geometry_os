; DESCRIPTION: Composite: . Then Creates a orange rectangular region at (49, 109) spanning 109 by 48 pixels. Then Places a orange line segment connecting (32, 78) to (220, 6).
; PLAN: r0=49(x), r1=109(y), r2=109(width), r3=48(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=32(x1), r1=78(y1), r2=220(x2), r3=6(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Creates a orange rectangular region at (49, 109) spanning 109 by 48 pixels.
; PLAN: r0=49(x), r1=109(y), r2=109(width), r3=48(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 109
LDI r2, 109
LDI r3, 48
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a orange line segment connecting (32, 78) to (220, 6).
; PLAN: r0=32(x1), r1=78(y1), r2=220(x2), r3=6(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 78
LDI r2, 220
LDI r3, 6
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
