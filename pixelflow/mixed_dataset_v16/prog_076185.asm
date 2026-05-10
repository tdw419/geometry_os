; DESCRIPTION: Places a orange line segment connecting (24, 35) to (350, 197).
; PLAN: r0=24(x1), r1=35(y1), r2=350(x2), r3=197(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 24
LDI r1, 35
LDI r2, 350
LDI r3, 197
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
