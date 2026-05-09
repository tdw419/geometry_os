; DESCRIPTION: Composite: . Then Places a black line segment connecting (194, 218) to (169, 60). Then Creates a orange rectangular region at (111, 10) spanning 111 by 20 pixels.
; PLAN: r0=194(x1), r1=218(y1), r2=169(x2), r3=60(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=111(x), r1=10(y), r2=111(width), r3=20(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a black line segment connecting (194, 218) to (169, 60).
; PLAN: r0=194(x1), r1=218(y1), r2=169(x2), r3=60(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 194
LDI r1, 218
LDI r2, 169
LDI r3, 60
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Creates a orange rectangular region at (111, 10) spanning 111 by 20 pixels.
; PLAN: r0=111(x), r1=10(y), r2=111(width), r3=20(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 111
LDI r1, 10
LDI r2, 111
LDI r3, 20
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
