; DESCRIPTION: Composite: . Then Renders a red box of size 28x68 starting at (92, 160). Then Places a orange line segment connecting (254, 96) to (118, 166).
; PLAN: r0=92(x), r1=160(y), r2=28(width), r3=68(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=254(x1), r1=96(y1), r2=118(x2), r3=166(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a red box of size 28x68 starting at (92, 160).
; PLAN: r0=92(x), r1=160(y), r2=28(width), r3=68(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 92
LDI r1, 160
LDI r2, 28
LDI r3, 68
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a orange line segment connecting (254, 96) to (118, 166).
; PLAN: r0=254(x1), r1=96(y1), r2=118(x2), r3=166(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 254
LDI r1, 96
LDI r2, 118
LDI r3, 166
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
