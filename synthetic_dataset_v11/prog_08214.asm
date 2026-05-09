; DESCRIPTION: Places a orange line segment connecting (20, 185) to (187, 231).
; PLAN: r0=20(x1), r1=185(y1), r2=187(x2), r3=231(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 185
LDI r2, 187
LDI r3, 231
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
