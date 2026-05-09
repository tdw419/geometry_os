; DESCRIPTION: Composite: . Then Places a red line segment connecting (169, 87) to (93, 16). Then Renders a blue box of size 101x109 starting at (41, 52).
; PLAN: r0=169(x1), r1=87(y1), r2=93(x2), r3=16(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=41(x), r1=52(y), r2=101(width), r3=109(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a red line segment connecting (169, 87) to (93, 16).
; PLAN: r0=169(x1), r1=87(y1), r2=93(x2), r3=16(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 169
LDI r1, 87
LDI r2, 93
LDI r3, 16
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Renders a blue box of size 101x109 starting at (41, 52).
; PLAN: r0=41(x), r1=52(y), r2=101(width), r3=109(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 52
LDI r2, 101
LDI r3, 109
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
