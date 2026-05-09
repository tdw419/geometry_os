; DESCRIPTION: Composite: . Then Creates a yellow rectangular region at (71, 123) spanning 118 by 53 pixels. Then Places a red line segment connecting (30, 203) to (201, 158).
; PLAN: r0=71(x), r1=123(y), r2=118(width), r3=53(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=30(x1), r1=203(y1), r2=201(x2), r3=158(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Creates a yellow rectangular region at (71, 123) spanning 118 by 53 pixels.
; PLAN: r0=71(x), r1=123(y), r2=118(width), r3=53(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 123
LDI r2, 118
LDI r3, 53
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a red line segment connecting (30, 203) to (201, 158).
; PLAN: r0=30(x1), r1=203(y1), r2=201(x2), r3=158(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 30
LDI r1, 203
LDI r2, 201
LDI r3, 158
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
