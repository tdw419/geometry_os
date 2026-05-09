; DESCRIPTION: Composite: . Then Places a orange line segment connecting (178, 252) to (131, 166). Then Renders a red box of size 19x88 starting at (15, 35).
; PLAN: r0=178(x1), r1=252(y1), r2=131(x2), r3=166(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=15(x), r1=35(y), r2=19(width), r3=88(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a orange line segment connecting (178, 252) to (131, 166).
; PLAN: r0=178(x1), r1=252(y1), r2=131(x2), r3=166(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 178
LDI r1, 252
LDI r2, 131
LDI r3, 166
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Renders a red box of size 19x88 starting at (15, 35).
; PLAN: r0=15(x), r1=35(y), r2=19(width), r3=88(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 15
LDI r1, 35
LDI r2, 19
LDI r3, 88
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
