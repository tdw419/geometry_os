; DESCRIPTION: Composite: . Then Places a green line segment connecting (118, 75) to (151, 169). Then Places a red circle of radius 68 at center (149, 95).
; PLAN: r0=118(x1), r1=75(y1), r2=151(x2), r3=169(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=149(x), r1=95(y), r2=68(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a green line segment connecting (118, 75) to (151, 169).
; PLAN: r0=118(x1), r1=75(y1), r2=151(x2), r3=169(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 118
LDI r1, 75
LDI r2, 151
LDI r3, 169
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a red circle of radius 68 at center (149, 95).
; PLAN: r0=149(x), r1=95(y), r2=68(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 149
LDI r1, 95
LDI r2, 68
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
