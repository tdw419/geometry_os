; DESCRIPTION: Places a orange line segment connecting (175, 175) to (470, 220).
; PLAN: r0=175(x1), r1=175(y1), r2=470(x2), r3=220(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 175
LDI r2, 470
LDI r3, 220
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
