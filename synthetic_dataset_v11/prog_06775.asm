; DESCRIPTION: Renders a orange line between points (152, 162) and (5, 151).
; PLAN: r0=152(x1), r1=162(y1), r2=5(x2), r3=151(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 152
LDI r1, 162
LDI r2, 5
LDI r3, 151
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
