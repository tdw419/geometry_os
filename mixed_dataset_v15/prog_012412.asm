; DESCRIPTION: Places a orange line segment connecting (270, 149) to (214, 170).
; PLAN: r0=270(x1), r1=149(y1), r2=214(x2), r3=170(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 270
LDI r1, 149
LDI r2, 214
LDI r3, 170
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
