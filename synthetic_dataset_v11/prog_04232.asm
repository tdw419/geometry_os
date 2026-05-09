; DESCRIPTION: Composite: . Then Draws a orange line from (179, 17) to (221, 25). Then Creates a green rectangular region at (207, 191) spanning 21 by 31 pixels.
; PLAN: r0=179(x1), r1=17(y1), r2=221(x2), r3=25(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=207(x), r1=191(y), r2=21(width), r3=31(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a orange line from (179, 17) to (221, 25).
; PLAN: r0=179(x1), r1=17(y1), r2=221(x2), r3=25(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 179
LDI r1, 17
LDI r2, 221
LDI r3, 25
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Creates a green rectangular region at (207, 191) spanning 21 by 31 pixels.
; PLAN: r0=207(x), r1=191(y), r2=21(width), r3=31(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 207
LDI r1, 191
LDI r2, 21
LDI r3, 31
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
