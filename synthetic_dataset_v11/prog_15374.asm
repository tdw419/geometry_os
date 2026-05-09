; DESCRIPTION: Places a orange line segment connecting (70, 73) to (33, 96).
; PLAN: r0=70(x1), r1=73(y1), r2=33(x2), r3=96(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 73
LDI r2, 33
LDI r3, 96
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
