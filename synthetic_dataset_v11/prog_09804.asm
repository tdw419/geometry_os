; DESCRIPTION: Composite: . Then Creates a blue rectangular region at (53, 8) spanning 72 by 119 pixels. Then Draws a red line from (17, 7) to (31, 155).
; PLAN: r0=53(x), r1=8(y), r2=72(width), r3=119(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=17(x1), r1=7(y1), r2=31(x2), r3=155(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Creates a blue rectangular region at (53, 8) spanning 72 by 119 pixels.
; PLAN: r0=53(x), r1=8(y), r2=72(width), r3=119(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 8
LDI r2, 72
LDI r3, 119
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Draws a red line from (17, 7) to (31, 155).
; PLAN: r0=17(x1), r1=7(y1), r2=31(x2), r3=155(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 7
LDI r2, 31
LDI r3, 155
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
