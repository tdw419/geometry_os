; DESCRIPTION: Places a orange line segment connecting (398, 70) to (270, 237).
; PLAN: r0=398(x1), r1=70(y1), r2=270(x2), r3=237(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 398
LDI r1, 70
LDI r2, 270
LDI r3, 237
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
