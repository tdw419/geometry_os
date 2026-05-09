; DESCRIPTION: Composite: . Then Creates a orange rectangular region at (199, 115) spanning 47 by 99 pixels. Then Places a purple line segment connecting (1, 40) to (56, 166).
; PLAN: r0=199(x), r1=115(y), r2=47(width), r3=99(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=1(x1), r1=40(y1), r2=56(x2), r3=166(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Creates a orange rectangular region at (199, 115) spanning 47 by 99 pixels.
; PLAN: r0=199(x), r1=115(y), r2=47(width), r3=99(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 199
LDI r1, 115
LDI r2, 47
LDI r3, 99
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a purple line segment connecting (1, 40) to (56, 166).
; PLAN: r0=1(x1), r1=40(y1), r2=56(x2), r3=166(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 1
LDI r1, 40
LDI r2, 56
LDI r3, 166
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
