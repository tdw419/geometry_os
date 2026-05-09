; DESCRIPTION: Places a orange line segment connecting (313, 7) to (260, 50).
; PLAN: r0=313(x1), r1=7(y1), r2=260(x2), r3=50(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 313
LDI r1, 7
LDI r2, 260
LDI r3, 50
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
