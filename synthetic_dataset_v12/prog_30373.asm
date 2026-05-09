; DESCRIPTION: Places a orange line segment connecting (150, 154) to (398, 119).
; PLAN: r0=150(x1), r1=154(y1), r2=398(x2), r3=119(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 150
LDI r1, 154
LDI r2, 398
LDI r3, 119
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
