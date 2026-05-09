; DESCRIPTION: Places a orange line segment connecting (236, 122) to (243, 161).
; PLAN: r0=236(x1), r1=122(y1), r2=243(x2), r3=161(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 236
LDI r1, 122
LDI r2, 243
LDI r3, 161
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
