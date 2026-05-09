; DESCRIPTION: Composite: . Then Places a green line segment connecting (61, 90) to (208, 187). Then Renders a green box of size 118x38 starting at (24, 145).
; PLAN: r0=61(x1), r1=90(y1), r2=208(x2), r3=187(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=24(x), r1=145(y), r2=118(width), r3=38(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a green line segment connecting (61, 90) to (208, 187).
; PLAN: r0=61(x1), r1=90(y1), r2=208(x2), r3=187(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 90
LDI r2, 208
LDI r3, 187
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Renders a green box of size 118x38 starting at (24, 145).
; PLAN: r0=24(x), r1=145(y), r2=118(width), r3=38(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 24
LDI r1, 145
LDI r2, 118
LDI r3, 38
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
