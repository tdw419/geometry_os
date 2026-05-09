; DESCRIPTION: Composite: . Then Creates a yellow rectangular region at (15, 77) spanning 117 by 92 pixels. Then Draws a blue line from (54, 100) to (30, 77).
; PLAN: r0=15(x), r1=77(y), r2=117(width), r3=92(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=54(x1), r1=100(y1), r2=30(x2), r3=77(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Creates a yellow rectangular region at (15, 77) spanning 117 by 92 pixels.
; PLAN: r0=15(x), r1=77(y), r2=117(width), r3=92(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 15
LDI r1, 77
LDI r2, 117
LDI r3, 92
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Draws a blue line from (54, 100) to (30, 77).
; PLAN: r0=54(x1), r1=100(y1), r2=30(x2), r3=77(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 100
LDI r2, 30
LDI r3, 77
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
