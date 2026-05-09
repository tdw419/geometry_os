; DESCRIPTION: Composite: . Then Creates a yellow rectangular region at (191, 118) spanning 58 by 100 pixels. Then Places a purple line segment connecting (48, 233) to (41, 39).
; PLAN: r0=191(x), r1=118(y), r2=58(width), r3=100(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=48(x1), r1=233(y1), r2=41(x2), r3=39(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Creates a yellow rectangular region at (191, 118) spanning 58 by 100 pixels.
; PLAN: r0=191(x), r1=118(y), r2=58(width), r3=100(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 191
LDI r1, 118
LDI r2, 58
LDI r3, 100
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a purple line segment connecting (48, 233) to (41, 39).
; PLAN: r0=48(x1), r1=233(y1), r2=41(x2), r3=39(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 48
LDI r1, 233
LDI r2, 41
LDI r3, 39
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
