; DESCRIPTION: Places a orange line segment connecting (202, 87) to (160, 7).
; PLAN: r0=202(x1), r1=87(y1), r2=160(x2), r3=7(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 202
LDI r1, 87
LDI r2, 160
LDI r3, 7
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
