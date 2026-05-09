; DESCRIPTION: Places a red line segment connecting (78, 17) to (219, 166).
; PLAN: r0=78(x1), r1=17(y1), r2=219(x2), r3=166(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 78
LDI r1, 17
LDI r2, 219
LDI r3, 166
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
