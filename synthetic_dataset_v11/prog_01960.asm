; DESCRIPTION: Composite: . Then Places a blue line segment connecting (129, 77) to (34, 241). Then Renders a white box of size 114x12 starting at (88, 8).
; PLAN: r0=129(x1), r1=77(y1), r2=34(x2), r3=241(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=88(x), r1=8(y), r2=114(width), r3=12(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a blue line segment connecting (129, 77) to (34, 241).
; PLAN: r0=129(x1), r1=77(y1), r2=34(x2), r3=241(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 77
LDI r2, 34
LDI r3, 241
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Renders a white box of size 114x12 starting at (88, 8).
; PLAN: r0=88(x), r1=8(y), r2=114(width), r3=12(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 88
LDI r1, 8
LDI r2, 114
LDI r3, 12
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
