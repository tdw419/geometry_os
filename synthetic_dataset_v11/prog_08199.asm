; DESCRIPTION: Composite: . Then Places a orange line segment connecting (151, 148) to (162, 51). Then Renders a red box of size 66x48 starting at (166, 83).
; PLAN: r0=151(x1), r1=148(y1), r2=162(x2), r3=51(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=166(x), r1=83(y), r2=66(width), r3=48(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a orange line segment connecting (151, 148) to (162, 51).
; PLAN: r0=151(x1), r1=148(y1), r2=162(x2), r3=51(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 148
LDI r2, 162
LDI r3, 51
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Renders a red box of size 66x48 starting at (166, 83).
; PLAN: r0=166(x), r1=83(y), r2=66(width), r3=48(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 166
LDI r1, 83
LDI r2, 66
LDI r3, 48
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
