; DESCRIPTION: Composite: . Then Places a red line segment connecting (76, 230) to (201, 133). Then Renders a green box of size 85x20 starting at (166, 20).
; PLAN: r0=76(x1), r1=230(y1), r2=201(x2), r3=133(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=166(x), r1=20(y), r2=85(width), r3=20(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a red line segment connecting (76, 230) to (201, 133).
; PLAN: r0=76(x1), r1=230(y1), r2=201(x2), r3=133(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 230
LDI r2, 201
LDI r3, 133
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Renders a green box of size 85x20 starting at (166, 20).
; PLAN: r0=166(x), r1=20(y), r2=85(width), r3=20(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 166
LDI r1, 20
LDI r2, 85
LDI r3, 20
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
