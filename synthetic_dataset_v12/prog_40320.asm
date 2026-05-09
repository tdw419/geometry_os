; DESCRIPTION: Places a orange line segment connecting (4, 153) to (196, 134).
; PLAN: r0=4(x1), r1=153(y1), r2=196(x2), r3=134(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 153
LDI r2, 196
LDI r3, 134
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
