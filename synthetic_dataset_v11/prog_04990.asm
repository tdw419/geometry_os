; DESCRIPTION: Composite: . Then Places a black line segment connecting (252, 104) to (187, 182). Then Renders a blue box of size 110x57 starting at (18, 102).
; PLAN: r0=252(x1), r1=104(y1), r2=187(x2), r3=182(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=18(x), r1=102(y), r2=110(width), r3=57(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a black line segment connecting (252, 104) to (187, 182).
; PLAN: r0=252(x1), r1=104(y1), r2=187(x2), r3=182(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 252
LDI r1, 104
LDI r2, 187
LDI r3, 182
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Renders a blue box of size 110x57 starting at (18, 102).
; PLAN: r0=18(x), r1=102(y), r2=110(width), r3=57(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 102
LDI r2, 110
LDI r3, 57
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
