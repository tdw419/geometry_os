; DESCRIPTION: Places a orange line segment connecting (125, 108) to (69, 220).
; PLAN: r0=125(x1), r1=108(y1), r2=69(x2), r3=220(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 108
LDI r2, 69
LDI r3, 220
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
