; DESCRIPTION: Places a orange line segment connecting (46, 88) to (243, 44).
; PLAN: r0=46(x1), r1=88(y1), r2=243(x2), r3=44(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 88
LDI r2, 243
LDI r3, 44
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
