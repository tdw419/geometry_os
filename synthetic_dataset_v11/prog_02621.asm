; DESCRIPTION: Composite: . Then Places a red line segment connecting (72, 99) to (122, 78). Then Draws a yellow circle centered at (128, 106) with radius 26.
; PLAN: r0=72(x1), r1=99(y1), r2=122(x2), r3=78(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=128(x), r1=106(y), r2=26(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a red line segment connecting (72, 99) to (122, 78).
; PLAN: r0=72(x1), r1=99(y1), r2=122(x2), r3=78(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 99
LDI r2, 122
LDI r3, 78
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Draws a yellow circle centered at (128, 106) with radius 26.
; PLAN: r0=128(x), r1=106(y), r2=26(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 128
LDI r1, 106
LDI r2, 26
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
