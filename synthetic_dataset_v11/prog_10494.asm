; DESCRIPTION: Composite: . Then Draws a red line from (132, 22) to (62, 67). Then Creates a white rectangular region at (8, 18) spanning 98 by 110 pixels.
; PLAN: r0=132(x1), r1=22(y1), r2=62(x2), r3=67(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=8(x), r1=18(y), r2=98(width), r3=110(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a red line from (132, 22) to (62, 67).
; PLAN: r0=132(x1), r1=22(y1), r2=62(x2), r3=67(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 132
LDI r1, 22
LDI r2, 62
LDI r3, 67
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Creates a white rectangular region at (8, 18) spanning 98 by 110 pixels.
; PLAN: r0=8(x), r1=18(y), r2=98(width), r3=110(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 8
LDI r1, 18
LDI r2, 98
LDI r3, 110
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
