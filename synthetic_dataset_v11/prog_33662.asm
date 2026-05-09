; DESCRIPTION: Composite: . Then Places a purple line segment connecting (171, 140) to (38, 220). Then Renders a yellow box of size 68x22 starting at (31, 136).
; PLAN: r0=171(x1), r1=140(y1), r2=38(x2), r3=220(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=31(x), r1=136(y), r2=68(width), r3=22(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a purple line segment connecting (171, 140) to (38, 220).
; PLAN: r0=171(x1), r1=140(y1), r2=38(x2), r3=220(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 171
LDI r1, 140
LDI r2, 38
LDI r3, 220
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Renders a yellow box of size 68x22 starting at (31, 136).
; PLAN: r0=31(x), r1=136(y), r2=68(width), r3=22(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 136
LDI r2, 68
LDI r3, 22
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
