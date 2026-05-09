; DESCRIPTION: Places a orange line segment connecting (121, 26) to (96, 16).
; PLAN: r0=121(x1), r1=26(y1), r2=96(x2), r3=16(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 121
LDI r1, 26
LDI r2, 96
LDI r3, 16
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
