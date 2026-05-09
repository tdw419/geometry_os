; DESCRIPTION: Composite: . Then Renders a white box of size 113x100 starting at (41, 145). Then Places a yellow line segment connecting (63, 22) to (252, 135).
; PLAN: r0=41(x), r1=145(y), r2=113(width), r3=100(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=63(x1), r1=22(y1), r2=252(x2), r3=135(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a white box of size 113x100 starting at (41, 145).
; PLAN: r0=41(x), r1=145(y), r2=113(width), r3=100(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 145
LDI r2, 113
LDI r3, 100
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a yellow line segment connecting (63, 22) to (252, 135).
; PLAN: r0=63(x1), r1=22(y1), r2=252(x2), r3=135(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 22
LDI r2, 252
LDI r3, 135
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
