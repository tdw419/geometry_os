; DESCRIPTION: Composite: . Then Creates a yellow rectangular region at (117, 3) spanning 83 by 100 pixels. Then Places a orange line segment connecting (30, 169) to (89, 250).
; PLAN: r0=117(x), r1=3(y), r2=83(width), r3=100(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=30(x1), r1=169(y1), r2=89(x2), r3=250(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Creates a yellow rectangular region at (117, 3) spanning 83 by 100 pixels.
; PLAN: r0=117(x), r1=3(y), r2=83(width), r3=100(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 117
LDI r1, 3
LDI r2, 83
LDI r3, 100
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a orange line segment connecting (30, 169) to (89, 250).
; PLAN: r0=30(x1), r1=169(y1), r2=89(x2), r3=250(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 30
LDI r1, 169
LDI r2, 89
LDI r3, 250
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
