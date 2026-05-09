; DESCRIPTION: Composite: . Then Places a red line segment connecting (222, 80) to (87, 100). Then Renders a red box of size 58x85 starting at (188, 100).
; PLAN: r0=222(x1), r1=80(y1), r2=87(x2), r3=100(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=188(x), r1=100(y), r2=58(width), r3=85(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a red line segment connecting (222, 80) to (87, 100).
; PLAN: r0=222(x1), r1=80(y1), r2=87(x2), r3=100(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 222
LDI r1, 80
LDI r2, 87
LDI r3, 100
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Renders a red box of size 58x85 starting at (188, 100).
; PLAN: r0=188(x), r1=100(y), r2=58(width), r3=85(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 188
LDI r1, 100
LDI r2, 58
LDI r3, 85
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
